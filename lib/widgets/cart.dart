import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/controller/dbfields.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:provider/provider.dart';

import '../constanst.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<Widget> items=[];
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
          if(value.mycardid.isEmpty)
            {
              value.cartidmethod();
              value.carttotal();
            }
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
                                  items.clear();
                                  if(snapshot.hasData){
                                    for(int i=0;i<snapshot.data!.docs.length;i++){
                                      String itemname=snapshot.data!.docs[i][Dbfields.itemname];
                                      String imageurl=snapshot.data!.docs[i][ItemReg.itemurl];
                                      String des=snapshot.data!.docs[i][ItemReg.description];
                                      String price=snapshot.data!.docs[i][Dbfields.price];
                                      String key=snapshot.data!.docs[i].id;
                                       // totalamt+=double.parse(price);
                                      items.add(FittedBox(
                                            child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    color: Colors.brown[30]
                                                                  ),
                                                                  height:300,
                                                                  width: 300,
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      CachedNetworkImage(
                                                                        imageUrl: imageurl,
                                                                        height: 200,
                                                                        imageBuilder: (context, imageProvider) => Container(
                                                                          decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                              image: imageProvider,
                                                                              fit: BoxFit.fill,
                                                                              // colorFilter: ColorFilter.mode(Colors.white, BlendMode.colorDodge)
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        placeholder: (context, url) => Transform.scale(scale:0.4,child: const CircularProgressIndicator()),
                                                                        errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,size: 40,),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(width: 20,),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                     Text(
                                                                      itemname,
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 15
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 15),
                                                                    SizedBox(
                                                                      width: 500,
                                                                      child:   Text(des,
                                                                        style: const TextStyle(
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 15),
                                                                     Text(
                                                                      "USD ${price}",
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 15
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 15),
                                                                    const Text(
                                                                      "In Stock",
                                                                      style: TextStyle(
                                                                          color: Global.mainColor,
                                                                          fontSize: 15
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                         InkWell(
                                                                          onTap: ()async{
                                                                            final progres=ProgressHUD.of(context);
                                                                            progres!.show();
                                                                            Future.delayed(const Duration(seconds: 10),(){
                                                                              progres.dismiss();
                                                                              //print("Stoped");
                                                                            });
                                                                            await value.carttotal();
                                                                            await value.deleteitem(key);
                                                                            //print(value.mycarttotal);
                                                                            progres.dismiss();
                                                                            if(value.mycarttotal==0)
                                                                              {
                                                                                Navigator.pushNamed(context, Routes.dashboard);
                                                                                value.resetcart(context);
                                                                              }
                                                                          },
                                                                          child: const Row(
                                                                            children: [
                                                                              Icon(Icons.delete_outline, color: Global.mainColor,),
                                                                              Text(
                                                                                "Remove",
                                                                                style: TextStyle(color: Global.mainColor,),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(width: 30),
                                                                        QuantityTableCell(),
                                                                        // Row(
                                                                        //   children: [
                                                                        //     Container(
                                                                        //       padding: const EdgeInsets.all(4),
                                                                        //       decoration: BoxDecoration(
                                                                        //           color: Global.mainColor,
                                                                        //           borderRadius: BorderRadius.circular(6)
                                                                        //       ),
                                                                        //       child: const Icon(Icons.remove),
                                                                        //     ),
                                                                        //     const SizedBox(width: 20),
                                                                        //     const SizedBox(
                                                                        //       width: 10,
                                                                        //       child: TextField(),),
                                                                        //     const SizedBox(width: 20),
                                                                        //     Container(
                                                                        //       padding: const EdgeInsets.all(4),
                                                                        //       decoration: BoxDecoration(
                                                                        //           color: Global.mainColor,
                                                                        //           borderRadius: BorderRadius.circular(6)
                                                                        //       ),
                                                                        //       child: const Icon(Icons.add),
                                                                        //     ),
                                                                        //   ],
                                                                        // ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Divider(),
                                              ],
                                            ),
                                                                                  ),
                                          ));
                                    }
                                    if(snapshot.data!.docs.isEmpty){
                                      value.resetcart(context);
                                      return Container(
                                        color: Global.mainColor,
                                          child: const Center(child: Text("Your cart is empty",style: TextStyle(fontSize: 20,color: Colors.white),)));
                                    //  Navigator.pushNamed(context, Routes.dashboard);
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
                                                                  "USD ${value.mycarttotal}",
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
                                                                      "Checkout (USD ${value.mycarttotal})",
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