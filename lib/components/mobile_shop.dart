import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import '../constanst.dart';
import '../controller/dbfields.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/social_media_icons.dart';

class MobileShop extends StatefulWidget {
  const MobileShop({super.key});

  @override
  State<MobileShop> createState() => _MobileShopState();
}

class _MobileShopState extends State<MobileShop> {
  String shoenum="";
  bool show=false;
  bool editShow=true;
  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.orange,
            // actions:  [
            //   Padding(
            //     padding: const EdgeInsets.only(right: 10.0),
            //     child: Text(value.companyname,
            //       style: const TextStyle(
            //           fontSize: 25,
            //           fontWeight: FontWeight.w600
            //       ),
            //     ),
            //   ),
            // ],
            title: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(value.companyname,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  child: Text(
                    value.companyname,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                ),
                //const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/ghana.png", height: 20, width: 20,),
                          const SizedBox(width: 8),
                          const Text("Ghana"),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          //signin(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 8),
                            Text("Login")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ExpansionTile(
                  leading: const Icon(Icons.menu, color: Colors.white54,),
                  title: const Text("MENU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  collapsedIconColor: Colors.white54,
                  childrenPadding: const EdgeInsets.only(left: 30),
                  collapsedBackgroundColor: Colors.black54,
                  backgroundColor: Colors.grey,
                  children: [
                    ListTile(
                      title: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.dashboard);
                          },
                          child: const MenuType(isSelected: true, coffeeType: 'HOME')),
                    ),
                    ListTile(
                      title: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.mainShop,);//arguments: "id"
                          },
                          child: const MenuType(isSelected: false, coffeeType: 'SHOP')),
                    ),
                    const ListTile(
                      title: MenuType(isSelected: false, coffeeType: 'ABOUT US'),
                    ),
                    const ListTile(
                      title: MenuType(isSelected: false, coffeeType: 'BLOG'),
                    ),
                    const ListTile(
                      title: MenuType(isSelected: false, coffeeType: 'CONTACT'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SocialMediaIcons(),
                    ],
                  ),
                ),
                // const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.email, size: 18,),
                      const SizedBox(width: 8,),
                      Text(value.companyemail, style: const TextStyle(fontSize: 12),),
                    ],
                  ),
                ),
                //const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_pin, size: 18,),
                      const SizedBox(width: 8),
                      Text(value.companyaddress, style: const TextStyle(fontSize: 12),),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
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
                      const SizedBox(height: 20,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
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

                                        //print("success");
                                      });
                                    },
                                    child: Container(
                                      color: Global.mainColor,
                                      height: 50,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 20.0, right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.menu, color: Colors.white,),
                                                Text("ALL CATEGORIES", style: TextStyle(color: Colors.white),
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
                                      height: 500,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0,top: 20),
                                            child: SizedBox(height: 300,
                                              child: StreamBuilder<QuerySnapshot>(
                                                  stream: Dbfields.db.collection("category").snapshots(),
                                                  builder: (context, snapshot) {
                                                    if(!snapshot.hasData)
                                                    {
                                                      return const Text("No data yet");

                                                    }
                                                    return ListView.builder(
                                                      scrollDirection: Axis.vertical,
                                                      itemCount: snapshot.data!.docs.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        String cate = snapshot.data!.docs[index]['name'];
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
                                                                      shoenum=cate;
                                                                    });
                                                                  },
                                                                  child: MenuType(
                                                                      isSelected: false,
                                                                      coffeeType: cate
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
                                        ],
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'What do you want?',
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
                                        Text("SEARCH", style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.lightBlue[50],
                                child: const Icon(
                                    Icons.call
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Companydata.phone, style: const TextStyle(fontWeight: FontWeight.bold),),
                                  const Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                color: Colors.lightGreen[50],
                                height: 400,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(Imagesurls.heritage2, fit: BoxFit.cover,),
                                    Center(
                                      child: Container(
                                        height: 300,
                                        color: Colors.lightBlue.withOpacity(0.2),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.lightBlue.withOpacity(0.6),
                                              child: const Column(
                                                children: [
                                                  TypeWriterText(
                                                    text: Text('HAND WOVEN \n BASKETS \n 100% NATURAL \n Free pickup delivery available',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold
                                                        )
                                                    ),
                                                    repeat: true,
                                                    duration: Duration(milliseconds: 50),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: (){},
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                  if (states.contains(MaterialState.pressed)) {
                                                    return Global.mainColor.withOpacity(0.5);
                                                  }
                                                  return Global.mainColor; // Default color
                                                }),
                                              ),
                                              child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
                                            )

                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sort by",
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Default",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              )
                            ],
                          ),
                          const Divider(
                            color: Global.mainColor,
                            indent: 150,
                            endIndent: 150,
                            thickness: 2,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              SizedBox(width: 10,),
                              Text("Items Found", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          featuredGridview(shoenum: shoenum, widgth: 250, height: 250, name: 12, price: 12, favHeight: 25, favWidth: 60, favSize: 25, cartHeight: 25, cartWidth: 60, cartSize: 25, querySnapshot: null,),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  height: 690,
                  color: Colors.lightGreen[50],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                const SizedBox(height: 8),
                                Text("Address: ${value.companyaddress}"),
                                const SizedBox(height: 6),
                                Text("Phone: ${value.companyphone}"),
                                const SizedBox(height: 6),
                                Text("Email: ${value.companyemail}"),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("About Us"),
                                Text("Who We Are"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Secure Products"),
                                Text("Project"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("About Our Shop"),
                                Text("Our Services"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Privacy And Policy"),
                                Text("SiteMap"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Information"),
                                Text("Contact"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                            SizedBox(height: 20),
                            Text("Get E-mail updates about our latest shop and special offers."),
                          ],
                        ),
                        const SizedBox(height: 8),
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
                        const SizedBox(height: 12,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialMediaIcons(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const Column(
                          children: [
                            Text('Copyright ©2024 All rights reserved.', style: TextStyle(fontSize: 15),),
                            SizedBox(width: 10),
                            Text('Powered By KologSoft', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
