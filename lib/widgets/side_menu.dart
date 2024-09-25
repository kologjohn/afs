import 'package:flutter/material.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:africanstraw/widgets/social_media_icons.dart';
import 'package:provider/provider.dart';

import '../constanst.dart';
import 'menu_type.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    super.key,
    required this.dWidth,
  });

  final double dWidth;

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool showoptionmenu=false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(
        builder: (BuildContext context, Ecom value, Widget? child){
          //value.paystacks("0552111770","200","432244892579076662");
          if(value.companyphone.isEmpty){
            value.companyinfo();
          }
          if(value.auth.currentUser!=null)
          {
            showoptionmenu=true;
          }
          return Drawer(
            width: widget.dWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        value.companyname,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
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
                    child: Column(
                      children: [
                        Row(
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
                                Navigator.pushNamed(context, Routes.login);
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
                      // ListTile(
                      //   title: InkWell(
                      //     onTap: (){
                      //       Navigator.pushNamed(context, Routes.about);
                      //     },
                      //       child: const MenuType(isSelected: false, coffeeType: 'ABOUT US')
                      //   ),
                      // ),
                      ExpansionTile(
                          title: const MenuType(isSelected: false, coffeeType: 'ABOUT US'),
                          childrenPadding: const EdgeInsets.only(left: 30),
                        children: [
                          ListTile(
                            title: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.about);
                                },
                                child: const Text("ABOUT AFS")
                            ),
                          ),
                          ListTile(
                            title: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.shipping);
                                },
                                child: const Text("SHIPPING PROCESS")
                            ),
                          ),
                          ListTile(
                            title: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.reshape);
                                },
                                child: const Text("RESHAPING BASKETS")
                            ),
                          ),
                          ListTile(
                            title: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.terms);
                                },
                                child: const Text("TERMS AND CONDITIONS")
                            ),
                          ),
                          ListTile(
                            title: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.returns);
                                },
                                child: const Text("RETURN POLICY")
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: InkWell(
                          onTap: (){
                            //Navigator.pushNamed(context, Routes.wholesale);
                          },
                            child: const MenuType(isSelected: false, coffeeType: 'WHOLESALE')
                        ),
                      ),
                      const ListTile(
                        title: MenuType(isSelected: false, coffeeType: 'BLOG'),
                      ),
                      ListTile(
                        title: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.contactPage);
                          },
                            child: const MenuType(
                                isSelected: false,
                                coffeeType: 'CONTACT')
                        ),
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
                        Text(value.companyemail),
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
                        Expanded(child: Text(value.companyaddress)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}