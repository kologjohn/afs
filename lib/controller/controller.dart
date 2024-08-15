import 'dart:convert';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/menu_type.dart';
import 'dbfields.dart';
class Ecom extends ChangeNotifier{
   final db=FirebaseFirestore.instance;
   final auth=FirebaseAuth.instance;
   static final querysnapshot=FirebaseFirestore.instance.collection("items").orderBy(ItemReg.category).limit(10).snapshots();
   final numformat = NumberFormat("#,##0.00", "en_US");

   //cart id with provider
   double currecyval=0;
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

  selected_category(String selected)async{
    selectedcategory=selected;
    notifyListeners();
  }

  lockcart()async{
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
    checkout(String email_txt,String fname_txt,String lnamme_txt,String addres_txt,String phone_txt, String country_txt,String region_txt, String city_txt,String postcode_txt)async{
    try{
       String payurl="";
       String accesscode="";
       bool status=false;
      final SharedPreferences  sprefs=await SharedPreferences.getInstance();
      final cart_id=sprefs.getString("cartid");
      await carttotal();
      await cartidmethod();
      await currecy();
      double ghs=currecyval*double.parse(cardvalue);
      final alreaypaid=await db.collection("checkout").doc(cart_id).get();
      if(alreaypaid.exists)
        {
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
      };
      await db.collection("checkout").doc(cart_id).set(checkoutdata);
      paystacks(phone_txt, cardvalue, cart_id!);
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
        shards.docs.forEach(
              (doc) {
            mycarttotal += double.parse(doc.data()['price']);
            cardvalue=numformat.format(mycarttotal);
          },
        );
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
      final eixistuser=await Dbfields.db.collection(Dbfields.users).doc(email).get();
      final countexiist=await Dbfields.db.collection(Dbfields.users).get();
      int userid=countexiist.docs.length+1;
      if(eixistuser.exists)
        {
          //await Dbfields.auth.createUserWithEmailAndPassword(email: email, password: password);
          if(auth.currentUser!=null)
            {
              Navigator.pushNamed(context, Routes.dashboard);
            }
        }
      else
        {
          final data={
            Dbfields.firstname:firstname,
            Dbfields.lastname:lastname,
            Dbfields.username:username,
            Dbfields.contact:contact,
            Dbfields.sex:sex,
            Dbfields.email:email,
            Dbfields.password:password,
            Dbfields.userid:userid
          };
          await Dbfields.db.collection(Dbfields.users).doc(email).set(data);
          if(auth.currentUser==null){
            await Dbfields.auth.createUserWithEmailAndPassword(email: email, password: password);
            Navigator.pushNamed(context, Routes.dashboard);
          }
          if(auth.currentUser!=null && !auth.currentUser!.emailVerified)
          {
            auth.currentUser!.updateDisplayName("$lastname $firstname");
            await auth.currentUser!.sendEmailVerification();
            Navigator.pushNamed(context, Routes.dashboard);
          }
          accountcreated=true;
          error="";
        }

    }on FirebaseException catch (e){
      accountcreated=false;
      error=e.code!;
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
    Future<List>addtocart(String itemname,String price,String quantity,String code,String imageurl,String description,BuildContext context)async{
      bool success=false;
      final SharedPreferences  sprefs=await SharedPreferences.getInstance();
      final cartId=sprefs.getString("cartid");
      bool? lock=sprefs.getBool("lockstatus");

      final alreaypaid=await db.collection("checkout").doc(cartId).get();
      if(alreaypaid.exists){
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
      else
        {
         // print("new transaction");
          if(Dbfields.auth.currentUser==null) {
            success=false;
            cardstatus=false;
            //print("Please u are not login");
            error="Please you must login before you can add to cart";
            notifyListeners();
          }
          else if(!Dbfields.auth.currentUser!.emailVerified){
            success=false;
            cardstatus=false;
            error="Your email is not verified. Check your inbox and verify your email";
            // print("You are not verified");
          }
          else
          {
            String? email=Dbfields.auth.currentUser!.email;
            String? contact=Dbfields.auth.currentUser!.phoneNumber;
            final date=DateTime.now();
            final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
            String? mycartids=sharedPreferences.getString("cartid");
            mycardid=mycartids!;
            final data={
              Dbfields.email:email,
              Dbfields.contact:contact,
              Dbfields.itemname:itemname,
              Dbfields.price:price,
              Dbfields.quantity:quantity,
              Dbfields.code:code,
              Dbfields.cartidnumber:mycartids,
              ItemReg.itemurl:imageurl,
              ItemReg.description:description
            };
            await Dbfields.db.collection(Dbfields.cart).add(data);
            cartidnumber=mycartids!;
            success=true;
            print("Added Successfully$cartidnumber");
            print("object");
          }
        }

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
            var request = http.Request('POST', Uri.parse('https://us-central1-heritageaskets.cloudfunctions.net/paystack'));
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
            } else {
              print("Error:${response.reasonPhrase}");
            }

          }

        }
      }
    }
    catch(e){
     print(e);
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
       var request = http.Request('POST', Uri.parse('https://us-central1-heritageaskets.cloudfunctions.net/currency'));
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
         final  finaldata = parsed['result'];
         currecyval=finaldata;
         print(finaldata);
       } else {
         print("Error:${response.reasonPhrase}");
       }

     }
     notifyListeners();
   }

}