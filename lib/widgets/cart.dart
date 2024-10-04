import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/controller/dbfields.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<Widget> items=[];
  List<String> qty_input=[];
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Consumer<Ecom>(
        builder: (BuildContext context, value, Widget? child) {
          String email="";
          if(value.auth.currentUser!=null)
            {
              email=value.auth.currentUser!.email!;
            }
          // if(value.mycardid.isEmpty)
          //   {
          //     value.cartidmethod();
          //     value.carttotal();
          //   }
          String cardnumber=value.mycardid;
          return Scaffold(
              appBar: AppBar(
                leading: InkWell(child: Icon(Icons.home),onTap: (){
                  Navigator.pushNamed(context, Routes.dashboard);
                },),
                centerTitle: true,
                title: const Text("Cart"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 1500,
                            color: Colors.white,
                            //height: 1500,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: value.db.collection("cart").where(Dbfields.cartidnumber, isEqualTo: cardnumber).snapshots(),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData){
                                    items.clear();
                                    qty_input.clear();
                                    for(int i=0;i<snapshot.data!.docs.length;i++){
                                      String itemname=snapshot.data!.docs[i][Dbfields.itemname];
                                      String itemcode=snapshot.data!.docs[i][Dbfields.code];
                                      String imageurl=snapshot.data!.docs[i][ItemReg.itemurl];
                                      String des=snapshot.data!.docs[i][ItemReg.description];
                                      String price=snapshot.data!.docs[i][Dbfields.price];
                                      String total=snapshot.data!.docs[i][Dbfields.total];
                                      String qty=snapshot.data!.docs[i][Dbfields.quantity];
                                      String key=snapshot.data!.docs[i].id;
                                      qty_input.add(qty);
                                      //print(qty_input[i].text);
                                       // totalamt+=double.parse(price);
                                      items.add(
                                          LayoutBuilder(
                                            builder: (context, constraints) {
                                              double screenWidth = constraints.maxWidth;
                                              bool isMobile = screenWidth < 600;

                                              return Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // Product Image Section
                                                        Container(
                                                          width: isMobile ? screenWidth * 0.3 : 200,
                                                          height: isMobile ? 150 : 150,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            color: Colors.brown[100],
                                                          ),
                                                          child: CachedNetworkImage(
                                                            imageUrl: imageurl,
                                                            imageBuilder: (context, imageProvider) => Container(
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                  image: imageProvider,
                                                                  fit: BoxFit.fill,
                                                                ),
                                                              ),
                                                            ),
                                                            placeholder: (context, url) => Center(
                                                                child: Transform.scale(
                                                                  scale: 0.4,
                                                                  child: const CircularProgressIndicator(),
                                                                )),
                                                            errorWidget: (context, url, error) => const Icon(
                                                              Icons.error,
                                                              color: Colors.red,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 16),

                                                        // Product Details Section
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              // Item Name
                                                              Text(
                                                                itemname,
                                                                style: const TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 18),
                                                              ),
                                                              const SizedBox(height: 10),

                                                              // Item Description
                                                              Text(
                                                                des,
                                                                style: const TextStyle(fontSize: 14),
                                                                maxLines: 2,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                              const SizedBox(height: 10),

                                                              // Price
                                                              Text(
                                                                "USD ${value.numformat.format(double.parse(total))}",
                                                                style: const TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 16),
                                                              ),

                                                              const SizedBox(height: 10),

                                                              // Stock Availability and Actions
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  // Stock Status
                                                                  // Text(
                                                                  //   true ? "Qty: $qty" : "Out of Stock",
                                                                  //   style: const TextStyle(
                                                                  //       color: true
                                                                  //           ? Colors.green
                                                                  //           : Colors.redAccent,
                                                                  //       fontWeight: FontWeight.bold,
                                                                  //       fontSize: 15),
                                                                  // ),
                                                                  Row(
                                                                    children: [

                                                                      InkWell(
                                                                        child: Container(
                                                                          height: 30,
                                                                          width: 30,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                  color: Colors.black26,
                                                                                  width: 2
                                                                              )
                                                                          ),
                                                                          child: const Icon(Icons.remove),
                                                                        ),
                                                                        onTap: ()async{
                                                                          final progress=ProgressHUD.of(context);
                                                                          int newval=int.parse(qty)-1;;
                                                                          if(newval<=0){
                                                                            value.snackbarerror("Invalid Quantity ", context);
                                                                            return;
                                                                          }
                                                                          qty_input[i]=newval.toString();
                                                                          final savetocard=await value.addtocart("single",itemname, price, qty_input[i], itemcode,imageurl,des,context);
                                                                          progress!.dismiss();

                                                                          print(qty);

                                                                          //print(savetocard);
                                                                          if(savetocard[0]){
                                                                            SnackBar snackbar=const SnackBar(content: Text("Added to cart successfully",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
                                                                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                          }
                                                                          else
                                                                          {
                                                                            SnackBar snackbar= SnackBar(content: Text(savetocard[1],style: const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
                                                                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                          }
                                                                        },
                                                                      ),
                                                                      Container(
                                                                        width: 60,
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                            color: Colors.black26,
                                                                            width: 2,
                                                                          ),
                                                                        ),
                                                                        child:  Center(
                                                                          child: TextFormField(
                                                                            keyboardType: TextInputType.number,
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow(RegExp(r'^[1-9]\d*')), // Allows only positive integers greater than zero
                                                                            ],
                                                                            onChanged: (val)async{
                                                                              final progress=ProgressHUD.of(context);
                                                                              qty_input[i]=val;
                                                                              final savetocard=await value.addtocart("single",itemname, price, qty_input[i], itemcode,imageurl,des,context);
                                                                              progress!.dismiss();
                                                                              print(qty);

                                                                              //print(savetocard);
                                                                              if(savetocard[0]){
                                                                                SnackBar snackbar=const SnackBar(content: Text("Added to cart successfully",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
                                                                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                              }
                                                                              else
                                                                              {
                                                                                SnackBar snackbar= SnackBar(content: Text(savetocard[1],style: const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
                                                                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                              }
                                                                              qty_input[i]=val;
                                                                            },
                                                                            textAlign: TextAlign.center,
                                                                            textAlignVertical: TextAlignVertical.center,
                                                                            decoration:  InputDecoration(
                                                                              hintText: qty,
                                                                              contentPadding: EdgeInsets.all(0),
                                                                              isDense: true,
                                                                              border: InputBorder.none,
                                                                            ),
                                                                            style: const TextStyle(
                                                                              fontSize: 14, // Adjust the font size as needed
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap: ()async{
                                                                          final progress=ProgressHUD.of(context);
                                                                          progress!.show();
                                                                          int newval=int.parse(qty)+1;;
                                                                            qty_input[i]=newval.toString();
                                                                            final savetocard=await value.addtocart("single",itemname, price, qty_input[i], itemcode,imageurl,des,context);
                                                                             progress!.dismiss();

                                                                          print(qty);

                                                                          //print(savetocard);
                                                                          if(savetocard[0]){
                                                                            SnackBar snackbar=const SnackBar(content: Text("Added to cart successfully",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
                                                                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                          }
                                                                          else
                                                                          {
                                                                            SnackBar snackbar= SnackBar(content: Text(savetocard[1],style: const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
                                                                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                          }

                                                                        },
                                                                        enableFeedback: true,
                                                                        child: Container(
                                                                          height: 30,
                                                                          width: 30,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                  color: Colors.black26,
                                                                                  width: 2
                                                                              )
                                                                          ),
                                                                          child: const Icon(Icons.add),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),

                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(),
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                      );
                                    }
                                   // print(snapshot.data!.docs.length);
                                  }

                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Wrap(
                                                  spacing: 5,
                                                  runSpacing: 5,
                                                  alignment: WrapAlignment.spaceBetween,
                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                  runAlignment: WrapAlignment.start,
                                                  children: [
                                                    Container(
                                                      //color: Colors.lightBlue[50],
                                                      //height: 300,
                                                      width: 800,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                                                        child: Column(
                                                          children: items
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      //height: 300,
                                                      width: 500,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            const Row(
                                                              children: [
                                                                Text(
                                                                  "Cart Summary",
                                                                  style: TextStyle(
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const Divider(),
                                                             Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                const Text(
                                                                  "Subtotal",
                                                                  style: TextStyle(
                                                                      fontSize: 15
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "USD ${value.numformat.format(value.mycarttotal)}",
                                                                  style: const TextStyle(
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 50),
                                                            InkWell(
                                                              onTap: ()async{
                                                                if(value.auth.currentUser!=null){
                                                                  value.currecy();
                                                                  Navigator.pushNamed(context, Routes.checkout);
                                                                  value.lockcart();
                                                                }
                                                                else{
                                                                  Navigator.pushNamed(context, Routes.login);
                                                                }

                                                                // final pgress=ProgressHUD.of(context);
                                                                // pgress!.show();
                                                                // Future.delayed(Duration(seconds: 10),(){
                                                                //   pgress.dismiss();
                                                                // });
                                                                // await value.paystacks("0553354349", value.cardvalue, value.mycardid);
                                                                // pgress.dismiss();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                color: Global.mainColor,
                                                                child:  Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Text(
                                                                      "Checkout (USD ${value.numformat.format(value.mycarttotal)})",
                                                                      style: const TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: 15
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}

class QuantityTableCell extends StatefulWidget {
  @override
  _QuantityTableCellState createState() => _QuantityTableCellState();
}

class _QuantityTableCellState extends State<QuantityTableCell> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementQuantity,
          ),
          Text('$_quantity'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementQuantity,
          ),
        ],
      ),
    );
  }
}