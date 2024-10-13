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

class Orders extends StatefulWidget {
  Orders({super.key});

  @override
  State<Orders> createState() => _CartViewState();
}

class _CartViewState extends State<Orders> {
  List<Widget> items=[];
  List<String> qty_input=[];
  double totalpurchase=0;
  List<TextEditingController> qty_controller=[];
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Consumer<Ecom>(
        builder: (BuildContext context, value, Widget? child) {
          double screenWidth = MediaQuery.of(context).size.width;
          bool isMobile = screenWidth < 600;
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
          String cardnumber=value.purchaseid;
          print(cardnumber);
          return Scaffold(
              appBar: AppBar(
                leading: InkWell(child: const Icon(Icons.home),onTap: (){
                  Navigator.pushNamed(context, Routes.dashboard);
                },),
                centerTitle: true,
                title:  Text("Pending Order- [ ${cardnumber}]",style: TextStyle(fontSize: 14),),
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
                            child: FutureBuilder<QuerySnapshot>(
                                future: value.db.collection("cart").where(Dbfields.cartidnumber, isEqualTo: cardnumber).get(),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData){
                                    items.clear();
                                    totalpurchase=0;
                                    qty_controller.clear();
                                    qty_input.clear();
                                    for(int i=0;i<snapshot.data!.docs.length;i++){
                                      String itemname=snapshot.data!.docs[i][Dbfields.itemname];
                                      String itemcode=snapshot.data!.docs[i][Dbfields.code];
                                      String imageurl=snapshot.data!.docs[i][ItemReg.itemurl];
                                      String des=snapshot.data!.docs[i][ItemReg.description];
                                      String price=snapshot.data!.docs[i][Dbfields.price];
                                      String total=snapshot.data!.docs[i][Dbfields.total];
                                      String qty=snapshot.data!.docs[i][Dbfields.quantity];
                                      String dimension=snapshot.data!.docs[i][ItemReg.dimensions];
                                      String status=snapshot.data!.docs[i][ItemReg.status];
                                      String weight=snapshot.data!.docs[i]['weight'];
                                      String key=snapshot.data!.docs[i].id;
                                      double total_amt=double.parse(total);
                                      Widget icon_status=const Tooltip(message:"No delivery or payment made",child: Icon(Icons.pending,size: 30,));
                                      totalpurchase+=total_amt;
                                      if(status!="pending")
                                        {
                                           icon_status=const Tooltip(message:"Completed",child: Icon(Icons.done_all,size: 30,color: Colors.blue,));

                                        }
                                      // totalamt+=double.parse(price);
                                      items.add(
                                          Padding(
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
                                                          const SizedBox(height: 10),
                                                          // Price
                                                          Text(
                                                            "Qty: ${value.numformat.format(double.parse(qty))}",
                                                            style: const TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16),
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Text(
                                                            "USD ${value.numformat.format(double.parse(total))}",
                                                            style: const TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16),
                                                          ),
                                                          icon_status
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(),
                                              ],
                                            ),
                                          )
                                        // LayoutBuilder(
                                        //   builder: (context, constraints) {
                                        //     double screenWidth = constraints.maxWidth;
                                        //     bool isMobile = screenWidth < 600;
                                        //
                                        //     return;
                                        //   },
                                        // )
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
                                                                  "USD ${value.numformat.format(totalpurchase)}",
                                                                  style: const TextStyle(
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 50),
                                                            Container(
                                                              height: 40,
                                                              color: Global.mainColor,
                                                              child:  Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    "Grand Total (USD ${value.numformat.format(totalpurchase)})",
                                                                    style: const TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 15
                                                                    ),
                                                                  )
                                                                ],
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
