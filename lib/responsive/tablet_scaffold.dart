import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:africanstraw/constanst.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/widgets/featuredgridview.dart';
import 'package:provider/provider.dart';
import '../components/global.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/side_menu.dart';
import '../widgets/social_media_icons.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  String shoenum="";
  bool show=false;
  bool editShow=true;
  late double dWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        title: Flexible(
          child: Text(Companydata.companyname,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        centerTitle: true,
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
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
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
                              const SizedBox(width: 10),
                              InkWell(
                                  onTap: ()async{
                                    await value.cartidmethod();
                                    final st=await value.alreadypaid(context);
                                    print(st);
                                    Navigator.pushNamed(context, Routes.cart);
                                  },
                                  child: const Icon(Icons.shopping_cart)
                              ),
                              const SizedBox(width: 10),
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
                                                  return const Text("No data yet");

                                                }
                                                return ListView.builder(
                                                  itemCount: snapshot.data!.docs.length,
                                                  scrollDirection: Axis.vertical,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    String cate=snapshot.data!.docs[index]['name'];
                                                    return  Column(
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
                                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // const Row(
                                            //   children: [
                                            //     Text("All Categories"),
                                            //     Icon(Icons.arrow_drop_down),
                                            //   ],
                                            // ),
                                            //const SizedBox(width: 50,),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  height: 50,
                                                  width: 300,
                                                  child: Column(
                                                    children: [
                                                      TextField(
                                                        decoration: InputDecoration(
                                                          hintText: 'What do you need?',
                                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                                          //border: InputBorder.none,
                                                        ),
                                                      )
                                                    ],
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
                                            const SizedBox(width: 50,),
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
                                                    Text(value.companyphone, style: const TextStyle(fontWeight: FontWeight.bold),),
                                                    const Text("support 24/7 time", style: TextStyle(color: Colors.black54, fontSize: 12),),
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  height: 400,
                                  color: Colors.lightBlue[50],
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "FRUIT FRESH",
                                                  style: TextStyle(
                                                      color: Global.mainColor,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 20
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                const Text(
                                                  "VEGETABLE",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 35
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                const Text(
                                                  "100% NATURAL",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 35
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                const Text(
                                                  "Free pickup delivery available",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: (){},
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                      if (states.contains(MaterialState.pressed)) {
                                                        return Global.mainColor.withOpacity(0.5); // Color when pressed
                                                      }
                                                      return Global.mainColor; // Default color
                                                    }),
                                                  ),
                                                  child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
                                                )

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CarouselSlider(
                                            items: [
                                              Image.asset(Imagesurls.heritage5, height: 400,),
                                              Image.asset(Imagesurls.heritage4, height: 400,),
                                              Image.asset(Imagesurls.heritage1, height: 400,),
                                              Image.asset(Imagesurls.heritage2, height: 400,),
                                            ],
                                            options: CarouselOptions(
                                              aspectRatio: 1.0,
                                              enlargeCenterPage: true,
                                              autoPlay: true,
                                              autoPlayInterval: const Duration(seconds: 3),
                                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Column(
                        children: [
                          Text("FEATURED PRODUCTS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                          Divider(
                            color: Global.mainColor,
                            indent: 300,
                            endIndent: 300,
                            thickness: 5,
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
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    height: 300,
                                    color: Colors.lightBlue[50],
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Image.asset(Imagesurls.heritage2, height: 300, width: 300,)
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "LAUNDRY BASKET",
                                                    style: TextStyle(
                                                        color: Global.mainColor,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                  //const SizedBox(height: 8),
                                                  const Text(
                                                    "Quality And Durable",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                  //const SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: (){},
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                        if (states.contains(MaterialState.pressed)) {
                                                          return Global.mainColor.withOpacity(0.5); // Color when pressed
                                                        }
                                                        return Global.mainColor; // Default color
                                                      }),
                                                    ),
                                                    child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    height: 300,
                                    color: Colors.lightGreen[50],
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Image.asset(Imagesurls.heritage5, height: 300, width: 300,)
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "BOLGA ROUND BASKET",
                                                    style: TextStyle(
                                                        color: Global.mainColor,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                  //const SizedBox(height: 8),
                                                  const Text(
                                                    "Quality And Durable",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                  //const SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: (){},
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                        if (states.contains(MaterialState.pressed)) {
                                                          return Global.mainColor.withOpacity(0.5); // Color when pressed
                                                        }
                                                        return Global.mainColor; // Default color
                                                      }),
                                                    ),
                                                    child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
                                                  )

                                                ],
                                              ),
                                            ),
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
                      const SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //         child: Container(
                      //           color: Colors.white,
                      //           height: 470,
                      //           child: const Column(
                      //             children: [
                      //               Text("TOP RATED PRODUCTS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
                      //               SizedBox(height: 18),
                      //               MyCarousel(enlargeCenter: false, viewPort: 0.5),
                      //             ],
                      //           ),
                      //         )
                      //     ),
                      //     const SizedBox(width: 8),
                      //     Expanded(
                      //         child: Container(
                      //           color: Colors.white,
                      //           height: 470,
                      //           child: const Column(
                      //             children: [
                      //               Text("TOP RATED PRODUCTS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
                      //               SizedBox(height: 18),
                      //               MyCarousel(enlargeCenter: false, viewPort: 0.5)
                      //             ],
                      //           ),
                      //         )
                      //     ),
                      //     const SizedBox(width: 8),
                      //   ],
                      // ),
                      const Column(
                        children: [
                          Text("FROM THE BLOG", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                          Divider(
                            color: Global.mainColor,
                            indent: 400,
                            endIndent: 400,
                            thickness: 5,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: SizedBox(
                                  height: 650,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.heritage4, height: 400,width: 400,),),
                                      const SizedBox(height: 18),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today, size: 18,),
                                            SizedBox(width: 4),
                                            Text("February 18, 2024"),
                                            SizedBox(width: 20),
                                            Row(
                                              children: [
                                                Icon(Icons.comment, size: 18,),
                                                SizedBox(width: 4),
                                                Text("10")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text("TRENDING FASHION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(Companydata.blogDescription,
                                              style: const TextStyle(color: Colors.black54, fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: SizedBox(
                                  height: 650,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.heritage5, height: 400,width: 400,),),
                                      const SizedBox(height: 18),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today, size: 18,),
                                            SizedBox(width: 4),
                                            Text("February 18, 2024"),
                                            SizedBox(width: 20),
                                            Row(
                                              children: [
                                                Icon(Icons.comment, size: 18,),
                                                SizedBox(width: 4),
                                                Text("10")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text("BOLGA ROUND BASKETS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(Companydata.blogDescription,
                                              style: const TextStyle(color: Colors.black54, fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: SizedBox(
                                  height: 650,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.heritage3, height: 400,width: 400,),),
                                      const SizedBox(height: 18),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today, size: 18,),
                                            SizedBox(width: 4),
                                            Text("February 18, 2024"),
                                            SizedBox(width: 20),
                                            Row(
                                              children: [
                                                Icon(Icons.comment, size: 18,),
                                                SizedBox(width: 4),
                                                Text("10")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text("INTERIOR DECOR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(Companydata.blogDescription,
                                              style: const TextStyle(color: Colors.black54, fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.lightGreen[50],
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                      Expanded(child: Text(Companydata.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)),
                                      const SizedBox(height: 20),
                                      Expanded(child: Text("Address: ${value.companyaddress}"),),
                                      const SizedBox(height: 15),
                                      Expanded(child: Text("Phone: ${value.companyphone}"),),
                                      const SizedBox(height: 15),
                                      Expanded(child: Text("Email: ${value.companyemail}")),
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
                                        Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                                        SizedBox(height: 20),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("About Us"),
                                              SizedBox(width: 16),
                                              Text("Who We Are"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Secure Products"),
                                              SizedBox(width: 16),
                                              Text("Project"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("About Our Shop"),
                                              SizedBox(width: 16),
                                              Text("Our Services"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Privacy And Policy"),
                                              SizedBox(width: 16),
                                              Text("SiteMap"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Delivery Information"),
                                              SizedBox(width: 16),
                                              Text("Contact"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                                child: SizedBox(
                                  height: 280,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
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
                                                    filled: true,
                                                  border: InputBorder.none
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
                                                    FittedBox(child: Text("SUBSCRIBE", style: TextStyle(color: Colors.white),)),
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
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
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
                              const SizedBox(width: 30),
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
                          ),
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

