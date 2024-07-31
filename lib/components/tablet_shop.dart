import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/constanst.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/widgets/drawer.dart';
import 'package:africanstraw/widgets/featuredgridview.dart';
import 'package:africanstraw/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import '../controller/dbfields.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/social_media_icons.dart';

class TabletShop extends StatefulWidget {
  const TabletShop({super.key});

  @override
  State<TabletShop> createState() => _TabletShopState();
}

class _TabletShopState extends State<TabletShop> {
  String shoenum="";
  bool show=false;
  bool editShow=true;
  @override
  Widget build(BuildContext context) {
    final querysnapshot;
    final data = ModalRoute.of(context)?.settings.arguments;
    if(data!=null){
      querysnapshot=Dbfields.db.collection("items").orderBy(ItemReg.category).startAt(['value']).snapshots();

    }
    else
      {
        querysnapshot=Dbfields.db.collection("items").orderBy(ItemReg.category).startAt(['value']).snapshots();

      }
    //Map<String, dynamic> mapData = jsonDecode(data.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        centerTitle: true,
        title: Text(
          data.toString(),
           // Companydata.companyname,
          style: const TextStyle(
            fontWeight: FontWeight.w500
          ),
        )
      ),
      drawer: const SideDrawer(dWidth: 400),
      body: Consumer<Ecom>(
        builder: (BuildContext context, Ecom value, Widget? child) {
          if(value.companyaddress.isEmpty)
          {
            value.companyinfo();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, Routes.singleProduct);
                                  },
                                  child: const Icon(Icons.favorite)
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                  onTap: ()async{
                                    await value.cartidmethod();
                                    final st=await value.alreadypaid(context);
                                    Navigator.pushNamed(context, Routes.cart);
                                  },
                                  child: const Icon(Icons.shopping_cart)
                              ),
                              const SizedBox(width: 8),
                              Text("Total: USD ${value.mycarttotal}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                    onTap: ()async{
                                      setState(() {
                                        if(show==false)
                                        {
                                          show=true;
                                        }
                                        else if(show==true)
                                        {
                                          show=false;
                                        }
                                        //show=true;
                                      });
                                    },
                                    child: Container(
                                      color: Global.mainColor,
                                      height: 50,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 18.0, right: 18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.menu, color: Colors.white,),
                                                Text(
                                                  "BASKETS CATEGORIES",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Visibility(
                                    visible: show,
                                    child: Container(
                                      height: 400,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20.0,top: 20),
                                        child: SizedBox(height: 300,
                                          child:StreamBuilder<QuerySnapshot>(
                                              stream: value.db.collection("category").snapshots(),
                                              builder: (context, snapshot) {
                                                if(!snapshot.hasData)
                                                {
                                                  return Text("No data yet");

                                                }
                                                return ListView.builder(
                                                  itemCount: snapshot.data!.docs.length,
                                                  scrollDirection: Axis.vertical,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    String categoryName = snapshot.data!.docs[index]['name'];
                                                    return  InkWell(
                                                      onTap: (){},
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: InkWell(
                                                              onTap: (){
                                                                setState(() {
                                                                  shoenum=categoryName;
                                                                });
                                                              },
                                                              child: MenuType(
                                                                  isSelected: false,
                                                                  coffeeType: categoryName
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(thickness: 1,color: Colors.grey[200],),

                                                        ],
                                                      ),
                                                    );

                                                  },
                                                );
                                              }
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      color: Colors.white,
                                      height: 60,
                                      child:  Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Text("All Categories"),
                                                const Icon(Icons.arrow_drop_down),
                                                const SizedBox(width: 30),
                                                const SizedBox(
                                                  height: 50,
                                                  width: 300,
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'What do you need?',
                                                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 80,
                                                  color: Global.mainColor,
                                                  child: const Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 8),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.lightGreen[50],
                                                  child: const Icon(
                                                    Icons.call, color: Global.mainColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(value.companyphone, style: TextStyle(fontWeight: FontWeight.bold),),
                                                    Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sort by",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 20),
                              Row(
                                children: [
                                  Text(
                                    "Default",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              )
                            ],
                          ),
                          // Divider(
                          //   color: Colors.orange,
                          //   indent: 150,
                          //   endIndent: 150,
                          //   thickness: 2,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              SizedBox(width: 10,),
                              Text("Items Found", style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          featuredGridview(shoenum: shoenum, widgth: 250, height: 150, name: 14, price: 14, favHeight: 30, favWidth: 80, favSize: 20, cartHeight: 30, cartWidth: 80, cartSize: 20, querySnapshot: null,)
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.lightGreen[50],
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10, top: 50),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  //color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Text(value.companyname, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)),
                                      const SizedBox(height: 20),
                                      Expanded(child: Text("Address: ${value.companyaddress}")),
                                      const SizedBox(height: 15),
                                      Expanded(child: Text("Phone: ${value.companyphone}")),
                                      const SizedBox(height: 15),
                                      Expanded(child: Text("Email: ${value.companyaddress}")),
                                    ],
                                  ),
                                )
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                                child: SizedBox(
                                  height: 250,
                                  //color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("About Us"),
                                            Text("Who We Are"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Secure Products"),
                                            Text("Project"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("About Our Shop"),
                                            Text("Our Services"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Privacy And Policy"),
                                            Text("SiteMap"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Delivery Information"),
                                            Text("Contact"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                                child: SizedBox(
                                  height: 250,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                                      const SizedBox(height: 20),
                                      const Text("Get E-mail updates about our latest shop and special offers."),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 2,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: 'Enter your mail',
                                                    fillColor: Colors.white,
                                                    filled: true
                                                ),
                                              )
                                          ),
                                          Expanded(
                                              child: Container(
                                                height: 50,
                                                color: Global.mainColor,
                                                child: const Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("SUBSCRIBE", style: TextStyle(color: Colors.white),),
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const SocialMediaIcons(),
                                    ],
                                  ),
                                  //color: Colors.red,
                                )
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text('Copyright ©2024 All rights reserved', style: TextStyle(fontSize: 15),),
                                SizedBox(width: 10),
                                Text('|'),
                                SizedBox(width: 10),
                                Text('Powered By KologSoft', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/visa1.png", height: 50,),
                                const SizedBox(width: 10),
                                Image.asset("assets/images/PayPal.png", height: 50,),
                                const SizedBox(width: 10),
                                Image.asset("assets/images/MasterCard1.png", height: 50,),
                                //Image.asset("assets/images/payout.png", height: 100,)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
