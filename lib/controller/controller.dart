import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import 'dbfields.dart';
class Ecom extends ChangeNotifier{
  final db=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  static final querysnapshot=FirebaseFirestore.instance.collection("items").orderBy(ItemReg.category).limit(10).snapshots();
  final numformat = NumberFormat("#,##0.00", "en_US");

  //cart id with provider
  double currecyval=0.0;
  bool lockstatus=false;
  String mycardid="";
  String companyname="";
  String companyemail="";
  String companyphone="";
  String companyaddress="";
  double mycarttotal=0;
  String cardvalue="0.00";
  String user_email="";
  String user_firstname="";
  String user_lastname="";
  String user_middlename="";
  String selectedcategory="";
  bool accountcreated=false;
  String error="";
  bool cardstatus=false;
  String cartidnumber="";
  bool loginstatus=false;
  String nextstate="";
  String selecteditem="";
  bool itemwithcardexist=false;
  String existingqty="0";
  String existingid="0";
  Map<String, dynamic> countryCityData = {};
  List<String> countries = [];
  List<String> cities = [];
  String? selectedCountry;
  String? selectedCity;

  Ecom(){
    get_current_item();
    getcstate();
    carttotal();
    currecy();
    fetchCountries();
  }
  set_selecteditem(String item)async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("selectedcode", item);
  }

  get_current_item()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? mysate=sharedPreferences.getString("selectedcode");
    selecteditem=mysate??"null";
    notifyListeners();
  }
  snackbarerror(String message,BuildContext context){
    SnackBar snackBar=SnackBar(content: Text(message,style: const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  snackbarsucess(String message,BuildContext context){
    SnackBar snackBar=SnackBar(content: Text(message,style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  selected_category(String selected)async{
    selectedcategory=selected;
    notifyListeners();
  }
  setnextstate(String cstate)async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("cstate", cstate);
  }
  getcstate()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? mysate=sharedPreferences.getString("cstate");
    nextstate=mysate??"null";
    notifyListeners();
  }

  resetnextstate()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove("cstate");
    nextstate="";
    notifyListeners();
  }
  lockcart()async{
    String? contact=Dbfields.auth.currentUser!.phoneNumber;
    String? email=Dbfields.auth.currentUser!.email;
    try{
      final shards = await db.collection('cart').where(Dbfields.cartidnumber,isEqualTo:mycardid).get();
      mycarttotal=0;
      shards.docs.forEach(
            (doc) async {

          final updatedata={Dbfields.email:email};
          final update=await db.collection("cart").doc(doc.id).update(updatedata);
        },
      );
      //print(mycarttotal);
    }catch(e){
      print(e);

    }
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool("lockstatus", true);
  }

  unlockcart()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool("lockstatus", false);
    notifyListeners();
  }

  alreadypaid(BuildContext context)async{
    final SharedPreferences  sprefs=await SharedPreferences.getInstance();
    final cart_id=sprefs.getString("cartid");
    final alreaypaid=await db.collection("checkout").doc(cart_id).get();
    bool status=false;
    if(alreaypaid.exists){
      bool status=alreaypaid[CheckoutFields.status];
      if(status)
      {
        // print("paid");
        status=true;
        sprefs.remove("cartid");
        SnackBar snackBar=const SnackBar(content: Text("Thank you have paid already",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),backgroundColor: Colors.green,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }
      else
      {
        SnackBar snackBar=const SnackBar(content: Text("Not paid"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        status=false;
      }

    }
    notifyListeners();
    return status;
  }
  Future<bool> alreadycheckedout()async{
    final SharedPreferences  sprefs=await SharedPreferences.getInstance();
    final cart_id=sprefs.getString("cartid");
    final alreaypaid=await db.collection("checkout").doc(cart_id).get();
    bool status=false;
    if(alreaypaid.exists){
      String url=alreaypaid[CheckoutFields.payurl];
      if(url.isNotEmpty)
      {
        status=true;
      }
      else
      {
        status=false;
      }

    }
    notifyListeners();
    return status;
  }
  resetcart(BuildContext context)async{
    final SharedPreferences  sprefs=await SharedPreferences.getInstance();
    final cart_id=sprefs.remove("cartid");

    //Navigator.pushNamed(context, Routes.dashboard);
  }
  checkout(String email_txt,String fname_txt,String lnamme_txt,String addres_txt,String phone_txt, String country_txt,String region_txt, String city_txt,String postcode_txt,String shipping,String destination)async{
    try{
      String payurl="";
      String accesscode="";
      bool status=false;
      final SharedPreferences  sprefs=await SharedPreferences.getInstance();
      final cart_id=sprefs.getString("cartid");
      await carttotal();
      await cartidmethod();
      await currecy();
      if(double.parse(shipping)<0)
        {
          error="Please check shipping fee";
          return;
        }
      double ghmyshipping=double.parse(shipping)*currecyval;
      double ghs=currecyval*(double.parse(cardvalue));
      final alreaypaid=await db.collection("checkout").doc(cart_id).get();
      if(alreaypaid.exists) {
        openpaystack(alreaypaid['payurl']);
        payurl=alreaypaid[CheckoutFields.payurl];
        accesscode=alreaypaid[CheckoutFields.accesscode];
      }
      final checkoutdata={
        CheckoutFields.firstname:fname_txt,
        CheckoutFields.lastname:lnamme_txt,
        CheckoutFields.address:addres_txt,
        CheckoutFields.phone:phone_txt,
        CheckoutFields.country:country_txt,
        CheckoutFields.region:region_txt,
        CheckoutFields.city:city_txt,
        CheckoutFields.postalcode:postcode_txt,
        CheckoutFields.cartid:sprefs.getString("cartid"),
        CheckoutFields.email:auth.currentUser!.email,
        CheckoutFields.total:cardvalue,
        CheckoutFields.ghtotal:"$ghs",
        CheckoutFields.payurl:payurl,
        CheckoutFields.accesscode:accesscode,
        CheckoutFields.status:status,
        CheckoutFields.shipping:"$shipping",
        CheckoutFields.destination:destination,
        CheckoutFields.ghshipping:"$ghmyshipping",
      };
      double payable=(double.parse(shipping)+double.parse(cardvalue))*100;
      await db.collection("checkout").doc(cart_id).set(checkoutdata);
      paystacks(phone_txt, "$payable", cart_id!);
      error="";
    }on FirebaseException catch(e){
      print(e);
      error=e.message!;
    }

  }
  carttotal()async{
    await cartidmethod();
    try{
      final shards = await db.collection('cart').where(Dbfields.cartidnumber,isEqualTo:mycardid ).get();
      mycarttotal=0;
      for (var doc in shards.docs) {
          mycarttotal += double.parse(doc.data()['total']);
          cardvalue=numformat.format(mycarttotal);
        }
      //print(mycarttotal);
    }catch(e){
      print(e);

    }
    notifyListeners();
  }
  deleteitem(String key)async{
    try{
      await db.collection("cart").doc(key).delete();
      carttotal();
      print("deleted");
    }catch(e){
      print(e);
    }
  }
  cartidmethod()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idgen=DateTime.timestamp().millisecondsSinceEpoch.toString();
    if(!prefs.containsKey("cartid"))
    {
      prefs.setString("cartid", idgen);
      mycardid=prefs.getString("cartid")!;
    }
    else
    {
      mycardid=prefs.getString("cartid")!;
    }
    notifyListeners();

  }
  String capitalizeSentence(String sentence) {
    List<String> words = sentence.split(' ');
    String result = '';

    for (String word in words) {
      if (word.isNotEmpty) {
        String capitalizedWord =
            word[0].toUpperCase() + word.substring(1).toLowerCase();
        result += capitalizedWord + ' ';
      }
    }

    return result.trim();
  }
  companyinfo()async{
    try{
      final dbcompanyinfo=await db.collection("settings").get();
      companyname=dbcompanyinfo.docs[0]['name'];
      companyemail=dbcompanyinfo.docs[0]['email'];
      companyphone=dbcompanyinfo.docs[0]['phone'];
      companyaddress=dbcompanyinfo.docs[0]['address'];
    }on FirebaseException catch(e){
      print(e.message);
    }

    notifyListeners();
  }
  itemslist()async{
    await db.collection('useitemrs').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //  print(doc["item"]);
      });
    });

  }
  signupwithemail(String firstname,String lastname,String username,String contact,String sex,String email,String password,BuildContext context)async{
    try{
      // final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      // sharedPreferences.setString("fname",firstname);
      // sharedPreferences.setString("lastname",lastname);
      // sharedPreferences.setString("phone",contact);
      //print(email);
      final eixistuser=await Dbfields.db.collection(Dbfields.users).doc(email).get();
      final countexiist=await Dbfields.db.collection(Dbfields.users).get();
      int userid=countexiist.docs.length+1;
      String notverified="Please check your email imbox to verify your account";
      if(eixistuser.exists) {
        // sharedPreferences.setString("fname",eixistuser[Dbfields.firstname]);
        // sharedPreferences.setString("lastname",eixistuser[Dbfields.lastname]);
        // sharedPreferences.setString("phone",eixistuser[Dbfields.contact]);
        //await Dbfields.auth.createUserWithEmailAndPassword(email: email, password: password);
        if(auth.currentUser!=null&& auth.currentUser!.emailVerified)
        {
          Navigator.pushNamed(context, Routes.dashboard);
        }
        else if(auth.currentUser!=null && !auth.currentUser!.emailVerified)
        {
          snackbarerror(notverified, context);
          await setnextstate("not verified");
          await getcstate();
          SnackBar snackBar=SnackBar(content: Text("Account Not Verified"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        }
        else
          {
            print("No Dcition");
          }
      }
      else {
        final data={
          Dbfields.firstname:firstname,
          Dbfields.lastname:lastname,
          Dbfields.username:username,
          Dbfields.contact:contact,
          Dbfields.sex:sex,
          Dbfields.email:email,
          Dbfields.userid:userid
        };
        await Dbfields.db.collection(Dbfields.users).doc(email).set(data);
        if(auth.currentUser==null){
          await Dbfields.auth.createUserWithEmailAndPassword(email: email, password: password);
          await auth.currentUser!.sendEmailVerification();
          //auth.currentUser!.updateDisplayName("${lastname} ${firstname}");
          auth.currentUser!.updateDisplayName("$lastname $firstname");
          accountcreated=true;
          error="";
          snackbarerror(notverified, context);
          await setnextstate("not verified");
          await getcstate();
          Navigator.pushNamed(context, Routes.dashboard);


        }
        else if(auth.currentUser!=null && !auth.currentUser!.emailVerified) {
          auth.currentUser!.updateDisplayName("$lastname $firstname");
          await auth.currentUser!.sendEmailVerification();
          accountcreated=true;
          error="";
          snackbarerror(notverified, context);
          await setnextstate("not verified");
          await getcstate();
          Navigator.pushNamed(context, Routes.dashboard);

        }
        else if(auth.currentUser!=null && auth.currentUser!.emailVerified) {
          auth.currentUser!.updateDisplayName("$lastname $firstname");
          await auth.currentUser!.sendEmailVerification();
          accountcreated=true;
          error="";
          Navigator.pushNamed(context, Routes.dashboard);
          await setnextstate("not verified");
          await getcstate();
          snackbarsucess("Account created successfully", context);


        }
        else
          {
            print("No decition");
          }
      }
    }on FirebaseException catch (e){
      accountcreated=false;
      error=e.code!;
      print(error);
    }
    notifyListeners();

  }
  loginwithemail(String email,String password) async{
    try{
      final mylogin= await Dbfields.auth.signInWithEmailAndPassword(email: email, password: password);
      if(!Dbfields.auth.currentUser!.emailVerified)
      {
        Dbfields.auth.currentUser!.sendEmailVerification();
        error="Please verify your email to continue to add to cart";
      }
      String? myemail=Dbfields.auth.currentUser!.email;
      //cartid("id", "date", false, "method", myemail!);
    }on FirebaseException catch(e){
      error=e.message!;
      // print(error);

    }

    notifyListeners();
  }
  cartids()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    mycardid= sharedPreferences.getString("cartid").toString();
    print(mycardid);
    notifyListeners();
  }
  item_alreadexist(String cartid,String itemcode)async{
    print("Cart ID: $cartid");
    final itemsdata=await db.collection("cart").where('cartidnumber', isEqualTo: cartid).where('code',isEqualTo: itemcode).get();
    bool existstatus=itemsdata.docs.isNotEmpty;
    if(existstatus)
      {
        existingqty=itemsdata.docs[0]['quantity'];
        existingid=itemsdata.docs[0].id;
      }
   // print(itemsdata.docs[0]['quantity']);
    itemwithcardexist= existstatus;
    notifyListeners();
  }
  Future<List>addtocart(String frompage,String itemname,String price,String quantity,String code,String imageurl,String description,BuildContext context)async{
    bool success=false;
    final SharedPreferences  sprefs=await SharedPreferences.getInstance();
    final cartId=sprefs.getString("cartid");
    bool? lock=sprefs.getBool("lockstatus");
    final alreaypaid=await db.collection("checkout").doc(cartId).get();
    if(alreaypaid.exists){
      error="Please you attempted making payment, go to cart and complete payment before you can add to cart";
      await carttotal();
      Navigator.pushNamed(context, Routes.cart);
      bool paid=alreaypaid['status'];
      if(paid){
        String url=alreaypaid[CheckoutFields.payurl];
        if(url.isNotEmpty)
        {

          error="You have a pending cart to complete, you can not add to pending cart";
          Navigator.pushNamed(context, Routes.dashboard);
          print("pending");
        }
        else
        {
          print("mmpending");
        }
      }

    }
    else {
      double total=double.parse(price)*double.parse(quantity);
      final date=DateTime.now();
      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      String? mycartids=sharedPreferences.getString("cartid")??"null";
      item_alreadexist(mycartids!,code);
      mycardid=mycartids!;
      await item_alreadexist(mycartids, code);
      if(itemwithcardexist)
        {
          if(frompage=="shop")
          {
            int updateqty=int.parse(existingqty)+int.parse(quantity);
            quantity=updateqty.toString();
            total=double.parse(quantity)*double.parse(price);
            print("exist");
          }
          print("1");
          final data={
            Dbfields.email:"",
            Dbfields.contact:"",
            Dbfields.itemname:itemname,
            Dbfields.price:price,
            Dbfields.quantity:quantity,
            Dbfields.code:code,
            Dbfields.cartidnumber:mycartids,
            ItemReg.itemurl:imageurl,
            ItemReg.total:total.toString(),
            ItemReg.description:description,
            ItemReg.status:"pending"
          };
          await Dbfields.db.collection(Dbfields.cart).doc(existingid).update(data);
          cartidnumber=mycartids!;
          success=true;
         //print("Item needs increment or update");
        }
      else
        {
          print("2");
          final data={
            Dbfields.email:"",
            Dbfields.contact:"",
            Dbfields.itemname:itemname,
            Dbfields.price:price,
            Dbfields.quantity:quantity,
            Dbfields.code:code,
            Dbfields.cartidnumber:mycartids,
            ItemReg.itemurl:imageurl,
            ItemReg.total:total.toString(),
            ItemReg.description:description,
            ItemReg.status:"pending"
          };
          await Dbfields.db.collection(Dbfields.cart).add(data);
          cartidnumber=mycartids!;
          success=true;
        }

     // print("Added Successfully$cartidnumber");
    }
    carttotal();
    notifyListeners();
    return [success,error];
  }
  Future<String> cartid(String id,String date,bool status,String method,String email)async{
    String cid="NO";
    if(Dbfields.auth.currentUser!.emailVerified){
      final data ={
        Dbfields.date:date,
        Dbfields.cartstatus:status,
        Dbfields.paymentmethod:method,
        Dbfields.email:email,
      };
      //check if the person has cartid that is not paid for;
      final cartidcount=await Dbfields.db.collection(Dbfields.cartids).get();
      final mycartid=await Dbfields.db.collection(Dbfields.cartids).where(Dbfields.cartstatus, isEqualTo: false).where(Dbfields.email, isEqualTo: email).get();
      print(mycartid.docs.length);
      if(mycartid.docs.isEmpty)
      {
        int realcartid=cartidcount.docs.length+1;
        await Dbfields.db.collection(Dbfields.cartids).doc("$realcartid").set(data);
        cid="$realcartid";
        print("New Cart ID Added");
        cartidnumber=cid;
      }
      else
      {
        cid=mycartid.docs[0].id;
        cartidnumber=cid;
        print("Already have unpaid Cart ID");
      }



    }
    notifyListeners();
    return cid;
  }
  Future<void> signInWithGoogle() async {
    // Create a new provider
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({
        'login_hint': 'user@example.com'
      });
      // Once signed in, return the UserCredential
      final my_login = await Dbfields.auth.signInWithPopup(googleProvider);
      if(my_login!=null)
      {
        String? displayname = auth.currentUser!.displayName;
        String? loginmail = auth.currentUser!.email;
        List? namelist = displayname!.split(" ");
        String fname = namelist[0];
        String lname = namelist[1];
        user_email=loginmail!;
        user_firstname=fname;
        user_lastname=lname;
      }
      //print(my_login);
    }on FirebaseException catch(e){
      // print(e);
      //errorMsgs=e.message!;
    }
    notifyListeners();
  }
  signout()async{
    try{
      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.remove("fname");
      sharedPreferences.remove("lastname");
      sharedPreferences.remove("phone");
      await auth.signOut();
    }on FirebaseException catch(e){
      error=e.message!;
      print(e.message);
    }

    notifyListeners();

  }
  Future<User?> signInWithGoogles({required BuildContext context}) async {
    print("Data....");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    // if (googleSignInAccount != null)
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =await auth.signInWithCredential(credential);
        user = userCredential.user;
        if(user!=null){
          String? displayname = auth.currentUser!.displayName;
          String? loginmail = auth.currentUser!.email;
          List? namelist = displayname!.split(" ");
          String fname = namelist[0];
          String lname = namelist[1];
          user_email=loginmail!;
          user_firstname=fname;
          user_lastname=lname;

          final existdata=await Dbfields.db.collection("users").doc(auth.currentUser!.email).get();
          if(existdata.exists)
          {
            print("Exist");
            Navigator.pushNamed(context, Routes.dashboard);
            // String phone=existdata.data()!['phone'];
            // await setsession(name!, email!, phone);
            // if(await SessionManager().containsKey("pin"))
            // {
            //   Navigator.pushNamed(context, Routes.pinscreen);
            //
            // }
            // else
            // {
            //   Navigator.pushNamed(context, Routes.pinsetup);
            //
            // }
          }
          else
          {
            print("No Exist");
            Navigator.pushNamed(context, Routes.signup);
          }
        }
      }
      else{
        print("NO");
      }
    } on FirebaseAuthException catch (e) {
      loginstatus=false;
      error=e.message!;
      if (e.code == 'account-exists-with-different-credential') {
        // handle the error here
      }
      else if (e.code == 'invalid-credential') {
        // handle the error here
      }
    } catch (e) {
      print(e);
      // handle the error here
    }

    notifyListeners();
    return user;
  }
  openpaystack(String url)async{
    try{
      final Uri url0 = Uri.parse(url);
      launchUrl(url0,
          webOnlyWindowName: "_self",
          mode: LaunchMode.platformDefault,
          webViewConfiguration: const WebViewConfiguration(
            enableDomStorage: true,
            enableJavaScript: true,
          ));

    }on FirebaseException catch (e){
      print(e.message);
      // print("Erro $e");
    }
  }
  paystacks(String phone,String amount,String tid) async {
    try{
      final alreaypaid=await db.collection("checkout").doc(tid).get();
      print(alreaypaid['payurl']);
      if(alreaypaid.exists)
      {
        String checkpayurl=alreaypaid['payurl'];
        print(checkpayurl);
        if(checkpayurl.isNotEmpty){
          print("paid");
        }
        else
        {
          String? email = auth.currentUser!.email;
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String? token = await user.getIdToken();
            var headers = {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            };
            var request = http.Request('POST', Uri.parse('https://us-central1-africanstraw-e03e1.cloudfunctions.net/paystack'));
            request.body = json.encode({
              "data": {
                "phone": phone,
                "email": email,
                "tid": tid,
                "reference": tid,
                "amount": amount,
                "message": "Data",
                "senderid": "Heritage"
              }
            });
            request.headers.addAll(headers);
            http.StreamedResponse response = await request.send();
            if (response.statusCode == 200) {
              String resdata = await response.stream.bytesToString();
              final Map parsed = json.decode(resdata);
              final Map finaldata = parsed['result'];

              String url = finaldata['data']['authorization_url'];
              String reference = finaldata['data']['reference'];
              String accessCode = finaldata['data']['access_code'];
              print(finaldata);
              if (finaldata['status']) {
                await db.collection("checkout").doc(tid).update({CheckoutFields.accesscode: accessCode,CheckoutFields.payurl:url});
                openpaystack(url);
              }
              else {
                print("URL NOT GENERATED");
              }
            }
            else {
              print("Error:${response.statusCode}");
            }

          }

        }
      }
    }on HttpException catch (e){
      print(e.message);
    }


  }
  currecy() async {
    String? email = "";
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email = auth.currentUser!.email;
      String? token = await user.getIdToken();
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request('POST', Uri.parse('https://us-central1-africanstraw-e03e1.cloudfunctions.net/currency'));
      request.body = json.encode({
        "data": {
          "email": email,
        }
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String resdata = await response.stream.bytesToString();
        final Map parsed = json.decode(resdata);
        String  finaldata = parsed['result'].toStringAsFixed(2);
        currecyval=double.parse(finaldata);
        print(finaldata);
      } else {
        print("Error:${response.reasonPhrase}");
      }

    }
    notifyListeners();
  }


  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
        countries = data.map((country) => country['name']['common'].toString()).toList();

    } else {
      throw Exception('Failed to load countries');
    }
  }
}