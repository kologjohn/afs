import 'package:africanstraw/blog/banner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/constanst.dart';
import 'package:africanstraw/controller/dbfields.dart';
import 'package:africanstraw/widgets/options_menu.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import '../blog/blog_post.dart';
import '../components/categoriesdData.dart';
import '../controller/controller.dart';
import '../footers/desktop_footer.dart';
import '../footers/tablet_footer.dart';
import '../widgets/featured_product.dart';
import '../widgets/main_menu.dart';
import '../widgets/menu_type.dart';
import '../widgets/side_menu.dart';
import '../widgets/social_media_icons.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  String searchQuery="";

  String shoenum="";
  bool show=false;
  bool editShow=true;
  bool showoptions=false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 250.0;

    bool isVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 1200;
    }
    bool isNotVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 1200;
    }

    bool isMainVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 500;
    }

    bool isMobileVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 500;
    }

    int crossAxisCount = (screenWidth / itemWidth).floor();
    if (screenWidth <= 400) {
      crossAxisCount = 2;
    }
    else if (screenWidth <= 600 && screenWidth<800) {
      crossAxisCount = (screenWidth / 200).floor();
    }
    else if(screenWidth >=600 && screenWidth<1000)
    {
      crossAxisCount = (screenWidth / 230).floor();

    }

    if (crossAxisCount <= 1) {
      crossAxisCount = 1;
    }
    return   Consumer<Ecom>(builder: (context,  value,  child) {

      if(value.mycarttotal==0)
      {
        // value.carttotal();
      }
      // print(value.mycardid);
      // if(value.companyemail.isEmpty){
      //   value.companyinfo();
      // }
      return Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.lightBlue[50],
          title:Visibility(
            visible: isVisible(),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email, size: 18,),
                      const SizedBox(width: 8,),
                      Text(value.companyemail, style: const TextStyle(fontSize: 15),),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.location_pin, size: 18,),
                      const SizedBox(width: 8),
                      Text(value.companyaddress, style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      const SocialMediaIcons(),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Image.asset(Imagesurls.hats, height: 30, width: 30,),
                          const SizedBox(width: 8),
                          //SvgPicture.asset("assets/svg/gh.svg", width: 40, height: 20,),
                          const Text("Ghana", style: TextStyle(fontSize: 15)),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 1, // or any desired width
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.login);
                          //itemupload(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 8),
                            Text("Login", style: TextStyle(fontSize: 15))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            options_menu(showoptionmenu: editShow, ecom: value,)
          ],
          automaticallyImplyLeading: isNotVisible(),
        ),
        drawer: Visibility(
            visible: isNotVisible(),
            child: const SideDrawer(dWidth: 350,)),
        backgroundColor: Colors.grey[200],
        body:  SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [
              Padding(
                  padding: MediaQuery.of(context).size.width < 500
                      ? const EdgeInsets.only(left: 5.0, right: 5.0, top: 15)
                      : const EdgeInsets.only(left: 50.0, right: 50.0, top: 15),
                  child: Container(
                    color: Colors.white,
                    //height: 10000,
                    child: Column(
                      children: [
                        // if(value.nextstate=="not verified")
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     width: 900,
                        //     color: Colors.red,
                        //     child: const Text("Please a verification email has been sent to your account",style: TextStyle(fontSize: 16,color: Colors.white),),
                        //   ),
                        // ),

                        Column(
                          children: [
                            Visibility(
                              visible: isVisible(),
                              child: Row(
                                children: [
                                  // const Expanded(
                                  //     flex: 2,
                                  //     child: SizedBox(
                                  //       //color: Colors.lightBlue[50],
                                  //       height: 50,
                                  //       child: Expanded(
                                  //         child: Column(
                                  //           children: [
                                  //             Expanded(
                                  //               child: Row(
                                  //                 //mainAxisAlignment: MainAxisAlignment.center,
                                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                                  //                 children: [
                                  //                   Expanded(child: Text("RAIN INN MALL", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
                                  //                 ],
                                  //               ),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     )),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      //color: Colors.lightBlue[50],
                                      height: 50,
                                      child:  Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: const [
                                                MainMenu(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                        height: 50,
                                        //color: Colors.red,
                                        child: Container(
                                          color: Global.primaryColor,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                   // Navigator.pushNamed(context, Routes.singleProduct);
                                                  },
                                                  child: const Icon(Icons.favorite,color: Colors.white,)
                                              ),
                                              InkWell(
                                                  onTap: ()async{
                                                    await value.cartidmethod();
                                                    final st=await value.alreadypaid(context);
                                                    Navigator.pushNamed(context, Routes.cart);
                                                  },
                                                  child: const Icon(Icons.shopping_cart,color: Colors.white,)
                                              ),
                                              Text("Total: USD ${value.mycarttotal}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ],
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Visibility(
                              visible: isVisible(),
                              child: Expanded(
                                flex: 2,
                                child: SizedBox(
                                    height: 600,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: ()async{
                                            setState(() {
                                              if (editShow==true)
                                              {
                                                editShow=false;
                                              }
                                              else {
                                                editShow=true;
                                              }
                                              //editShow=false;
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Global.mainColor,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 18.0, right: 18),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.menu, color: Colors.white,),
                                                        Text(
                                                          "ALL CATEGORIES",
                                                          style: TextStyle(
                                                              color: Colors.white
                                                          ),
                                                        )
                                                      ],
                                                    ),
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
                                        ),
                                        Visibility(
                                          visible: editShow,
                                          child: Container(
                                            color: Colors.white,
                                            height: 550,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                                              child: Categories(value)

                                              // StreamBuilder<QuerySnapshot>(
                                              //     stream: Dbfields.db.collection("category").snapshots(),
                                              //     builder: (context, snapshot) {
                                              //       if(!snapshot.hasData){
                                              //         return const Text("Loading...");
                                              //       }
                                              //       else if(snapshot.connectionState!=ConnectionState.active){
                                              //         return const Text("Connection Error",style: TextStyle(color: Colors.red),);
                                              //       }
                                              //       else if(snapshot.data!.docs.isEmpty)
                                              //       {
                                              //         return const Text("Empty Baskets Category");
                                              //       }
                                              //       return ListView.builder(
                                              //         scrollDirection: Axis.vertical,
                                              //         itemCount: snapshot.data!.docs.length,
                                              //         itemBuilder: (BuildContext context, int index) {
                                              //           String cate=snapshot.data!.docs[index]['name'];
                                              //           return Container(child: Column(
                                              //             crossAxisAlignment: CrossAxisAlignment.start,
                                              //             children: [
                                              //               InkWell(
                                              //                 onTap: (){
                                              //                   setState(() {
                                              //                     shoenum=cate;
                                              //                   });
                                              //                 },
                                              //                 child: InkWell(
                                              //                   onTap: (){
                                              //                     value.selected_category(cate);
                                              //                     Navigator.pushNamed(context, Routes.mainShop, arguments: {"cate":cate,"from":"desktop"});
                                              //                   },
                                              //                   child: MenuType(
                                              //                       isSelected: false,
                                              //                       coffeeType: cate
                                              //                   ),
                                              //                 ),
                                              //               ),
                                              //               Divider(thickness: 1,color: Colors.grey[200],),
                                              //               const SizedBox(height: 10),
                                              //             ],
                                              //           ),
                                              //           );
                                              //         },
                                              //       );
                                              //     }
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: isNotVisible(),
                                    child: Column(
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
                                  ),
                                  const SizedBox(height: 20),
                                  Visibility(
                                    visible: isNotVisible(),
                                    child: Column(
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
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
                                                        child:Categories(value),
                                                        // StreamBuilder<QuerySnapshot>(
                                                        //     stream: value.db.collection("category").snapshots(),
                                                        //     builder: (context, snapshot) {
                                                        //       if(!snapshot.hasData)
                                                        //       {
                                                        //         return const Text("No data yet");
                                                        //       }
                                                        //       return ListView.builder(
                                                        //         itemCount: snapshot.data!.docs.length,
                                                        //         scrollDirection: Axis.vertical,
                                                        //         itemBuilder: (BuildContext context, int index) {
                                                        //           String cate=snapshot.data!.docs[index]['name'];
                                                        //           return  Column(
                                                        //             crossAxisAlignment: CrossAxisAlignment.start,
                                                        //             children: [
                                                        //               Padding(
                                                        //                 padding: const EdgeInsets.all(4.0),
                                                        //                 child: InkWell(
                                                        //                   onTap: (){
                                                        //                     setState(() {
                                                        //                       shoenum=cate;
                                                        //                     });
                                                        //                   },
                                                        //                   child: MenuType(
                                                        //                       isSelected: false,
                                                        //                       coffeeType: cate
                                                        //                   ),
                                                        //                 ),
                                                        //               ),
                                                        //               Divider(thickness: 1,color: Colors.grey[200],),
                                                        //             ],
                                                        //           );
                                                        //         },
                                                        //       );
                                                        //     }
                                                        // ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                color: Colors.white,
                                                height: 50,
                                                child:  Padding(
                                                  padding: const EdgeInsets.only(right: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Row(
                                                          children: [
                                                            // const Text("All Categories", style: TextStyle(fontWeight: FontWeight.bold),),
                                                            // const SizedBox(width: 20),
                                                            // const Icon(Icons.arrow_drop_dow
                                                            // const SizedBox(width: 30),
                                                            Expanded(
                                                              flex:3,
                                                              child: SizedBox(
                                                                height: 50,
                                                                width: 300,
                                                                child: Column(
                                                                  children: [
                                                                    // TextFormField()
                                                                    TextFormField(

                                                                      decoration: const InputDecoration(
                                                                          hintText: 'What do you need?',
                                                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                                                          //border: InputBorder.none,
                                                                          filled: true,
                                                                          fillColor: Colors.white
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex:1,
                                                              child: Container(
                                                                height: 50,
                                                                width: 100,
                                                                color: Global.mainColor,
                                                                child: const Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      Visibility(
                                                        visible: isVisible(),
                                                        child: Expanded(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,

                                                            children: [

                                                              CircleAvatar(
                                                                backgroundColor: Colors.lightBlue[50],
                                                                child: const Icon(
                                                                  Icons.call, color: Global.mainColor,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 12),
                                                              Flexible(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(child: Text(value.companyphone, style: const TextStyle(fontWeight: FontWeight.bold),)),
                                                                    const Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Visibility(
                                    visible: true && !isMainVisible(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: [

                                              CircleAvatar(
                                                backgroundColor: Colors.lightBlue[50],
                                                child: const Icon(
                                                  Icons.call, color: Global.mainColor,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(value.companyphone, style: const TextStyle(fontWeight: FontWeight.bold),),
                                                  const Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Visibility(
                                    visible: isMainVisible(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        color: Colors.lightBlue[50],
                                        height: 530,
                                        child:  Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 40.0, right: 20),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          const Text(
                                                            "HAND WOVEN",
                                                            style: TextStyle(
                                                                color: Global.mainColor,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 25
                                                            ),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          const Text(
                                                            "BASKETS",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 40
                                                            ),
                                                          ),
                                                          const SizedBox(height: 5),
                                                          const Text(
                                                            "100% NATURAL",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 40
                                                            ),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          const Text(
                                                            "Free pickup delivery available",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 25
                                                            ),
                                                          ),
                                                          const SizedBox(height: 20),
                                                          ElevatedButton(
                                                            onPressed: (){
                                                              Navigator.pushNamed(context, Routes.mainShop);
                                                            },
                                                            style: ButtonStyle(
                                                              backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                                if (states.contains(MaterialState.pressed)) {
                                                                  return Global.mainColor.withOpacity(0.5);
                                                                }
                                                                return Global.mainColor;
                                                              }),
                                                            ),
                                                            child: const Text("SHOP NOW", style: TextStyle(color: Colors.white, fontSize: 8),),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              //flex: 2,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          color: Colors.lightBlue[50],
                                                          height: 530,
                                                          child: CarouselSlider(
                                                            items: [
                                                              Image.asset(Imagesurls.A8A0463, height: 500,),
                                                              Image.asset(Imagesurls.A8A0487, height: 500,),
                                                              Image.asset(Imagesurls.A8A0530, height: 500,),
                                                              Image.asset(Imagesurls.afs6, height: 500,),
                                                              Image.asset(Imagesurls.afs7, height: 500,),
                                                              Image.asset(Imagesurls.afs8, height: 500,),
                                                            ],
                                                            options: CarouselOptions(
                                                              aspectRatio: 16/9,
                                                              enlargeCenterPage: false,
                                                              autoPlay: true,
                                                              autoPlayInterval: const Duration(seconds: 3),
                                                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                                              enableInfiniteScroll: true,
                                                              autoPlayCurve: Curves.fastOutSlowIn,
                                                              scrollDirection: Axis.horizontal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: true && !isMainVisible(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                color: Colors.lightGreen[50],
                                                height: 400,
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  children: [
                                                    Image.asset(Imagesurls.A8A0487, fit: BoxFit.cover,),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 50),
                        const Column(
                          children: [
                            Text("FEATURED BASKETS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                            Divider(
                              color: Global.mainColor,
                              indent: 800,
                              endIndent: 800,
                              thickness: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 500,
                            child:FutureBuilder<QuerySnapshot>(
                              future: Dbfields.db.collection("items").orderBy('date').limit(8).get(),
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text("Loading...");
                                } else if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return const Text("Error Loading Data");
                                }

                                var filteredDocs = snapshot.data!.docs.where((doc) {
                                  var data = doc.data() as Map<String, dynamic>;
                                  String item = data['item']?.toString().toLowerCase() ?? '';
                                  String category = data['category']?.toString().toLowerCase() ?? '';
                                  String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                                  return item.contains(searchQuery.toLowerCase()) ||
                                      category.contains(searchQuery.toLowerCase()) ||
                                      price.contains(searchQuery.toLowerCase());
                                }).toList();

                                return GridView.builder(
                                  itemCount: filteredDocs.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 0.6,
                                    childAspectRatio: 0.7,
                                    crossAxisCount: crossAxisCount.ceil(),
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    final fetchedData = filteredDocs[index];
                                    String itemname = fetchedData['item'];
                                    String item_code = fetchedData['code'];
                                    String url = fetchedData['itemurl'];
                                    String sellingprice = fetchedData[ItemReg.sellingprice];

                                    return FittedBox(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              print(item_code);
                                              value.cartids();
                                              value.cartidmethod();
                                              await value.set_selecteditem(item_code);
                                              value.setnextstate("cart");
                                              await value.get_current_item();
                                              value.item_alreadexist(value.cartidnumber, item_code);
                                              Navigator.pushNamed(context, Routes.singleProduct);
                                            },
                                            child: Container(
                                              width: 220,
                                              child: FeaturedProduct(
                                                featuredImage: url,
                                                featuredName: itemname,
                                                featuredPrice: sellingprice,
                                                image: CachedNetworkImage(
                                                  errorListener: (rr) {
                                                    // handle error
                                                  },
                                                  imageUrl: url,
                                                  height: 200,
                                                  width: 400,
                                                  fit: BoxFit.contain,
                                                  placeholder: (context, url) => const Center(
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => const Icon(
                                                    Icons.error,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                progress: false,
                                                consWidth: itemWidth,
                                                frompage: 'shop',
                                                featuredcode: ItemReg.item,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            )

                          // StreamBuilder<QuerySnapshot>(
                            //   stream: Dbfields.db.collection("items").orderBy('date').limit(8).snapshots(),
                            //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            //     if(!snapshot.hasData){
                            //       return const Text("Loading...");
                            //     }
                            //     else if(snapshot.connectionState==ConnectionState.waiting)
                            //     {
                            //       const CircularProgressIndicator();
                            //     }
                            //     else if(snapshot.hasError)
                            //     {
                            //       return const Text("Error Loading Data");
                            //     }
                            //     //urls.clear();
                            //     // myimage.clear();
                            //     var filteredDocs = snapshot.data!.docs.where((doc) {
                            //       var data = doc.data() as Map<String, dynamic>;
                            //       String item = data['item']?.toString().toLowerCase() ?? '';
                            //       String category = data['category']?.toString().toLowerCase() ?? '';
                            //       String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                            //       return item.contains(searchQuery.toLowerCase()) || category.contains(searchQuery.toLowerCase() )||price.contains(searchQuery.toLowerCase());
                            //
                            //     }).toList();
                            //     // for(int i=0;i<snapshot.data!.docs.length;i++){
                            //     //   //print(i);
                            //     //   String url= snapshot.data!.docs[i][ItemReg.itemurl];
                            //     //   urls.add(url);
                            //     //
                            //     //   //print(url);
                            //     //
                            //     //
                            //     // }
                            //     return GridView.builder(
                            //       itemCount: filteredDocs.length,
                            //       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            //         mainAxisSpacing: 0.6,
                            //         childAspectRatio: 0.7,
                            //         crossAxisCount: crossAxisCount.ceil(),
                            //       ), itemBuilder: (BuildContext context, int index) {
                            //       final fetchedData = filteredDocs[index];
                            //       String itemname=fetchedData['item'];
                            //       String item_code=fetchedData['code'];
                            //       String url=fetchedData['itemurl'];
                            //       String sellingprice=fetchedData[ItemReg.sellingprice];
                            //       return FittedBox(
                            //         child: Row(
                            //           children: [
                            //             InkWell(
                            //               onTap: ()async{
                            //                 print(item_code);
                            //                 value.cartids();
                            //                 value.cartidmethod();
                            //                 await value.set_selecteditem(item_code);
                            //                 value.setnextstate("cart");
                            //                 await value.get_current_item();
                            //                 value.item_alreadexist(value.cartidnumber,item_code );
                            //                 Navigator.pushNamed(context, Routes.singleProduct);
                            //               },
                            //               child: Container(
                            //                 // height: 300,
                            //                 width: 220,
                            //                 child: FeaturedProduct(
                            //                   featuredImage:url,
                            //                   featuredName: itemname,
                            //                   featuredPrice: sellingprice,
                            //                   image: CachedNetworkImage(
                            //                     errorListener:(rr){
                            //                       //print("${name_txt} image are not uploaded yet");
                            //                     } ,
                            //                     imageUrl: url,
                            //                     height: 200,
                            //                     width: 400,
                            //                     fit: BoxFit.contain,
                            //                     placeholder: (context, url) => const Center(
                            //                       child: SizedBox(
                            //                         height: 50,
                            //                         width: 50,
                            //                         child: CircularProgressIndicator(),
                            //                       ),
                            //                     ),
                            //                     errorWidget: (context, url, error) =>const Icon(Icons.error,color: Colors.red,),
                            //                   ),
                            //                   progress: false,
                            //                   consWidth: itemWidth, frompage: 'shop',
                            //                   featuredcode: ItemReg.item,
                            //                 ),
                            //               ),
                            //             )
                            //             // items[index]
                            //           ],
                            //         ),
                            //       );
                            //     },);
                            //     // Wrap(
                            //     // runSpacing: 5,
                            //     // spacing: 5,
                            //     // children: items
                            //     // );
                            //   },
                            // )
                          //featuredGridview(shoenum: shoenum, widgth: 300, height: 200, name: 16, price: 16, favHeight: 30, favWidth: 100, favSize: 25, cartHeight: 30, cartWidth: 100, cartSize: 25, querySnapshot: querysnapshot,),
                        ),
                        // StreamBuilder<QuerySnapshot>(
                        //   stream: null,
                        //   builder: (context, snapshot) {
                        //     return Container(height:500,child: featuredGridview(shoenum: shoenum, widgth: 250, height: 150, name: 14, price: 14, favHeight: 30, favWidth: 80, favSize: 20, cartHeight: 30, cartWidth: 80, cartSize: 20, querySnapshot: Ecom.querysnapshot,));
                        //   }
                        // ),

                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 80),
                        SizedBox(
                          width: 1300,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              alignment: WrapAlignment.center,
                              children: [
                                BannerPost(title: 'OVAL  BASKETS', subTitle: 'Quality And Durable', imageUrl: Imagesurls.afs1, conColor: Colors.lightBlue[50],),
                                BannerPost(title: 'V-SHAPE  BASKETS', subTitle: 'Quality And Durable', imageUrl: Imagesurls.afs3, conColor: Colors.lightGreen[50]),
                              ],
                            ),
                          )
                        ),
                        const SizedBox(height: 30),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 30),
                        const Column(
                          children: [
                            Text("FROM THE BLOG", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                            Divider(
                              color: Global.mainColor,
                              indent: 800,
                              endIndent: 800,
                              thickness: 5,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20),
                          child: SizedBox(
                            width: 1300,
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              alignment: WrapAlignment.center,
                              children: [
                                BlogPost(title: 'TRENDING FASHIONS', mainText: Companydata.blogDescription, date: 'August 18, 2024', comments: '69', imageUrl: Imagesurls.A8A0463,),
                                BlogPost(title: 'BOLGA ROUND BASKETS', mainText: Companydata.blogDescription, date: 'August 23, 2024', comments: '40', imageUrl: Imagesurls.A8A0530,),
                                BlogPost(title: 'INTERIOR DECOR', mainText: Companydata.blogDescription, date: 'August 27, 2024', comments: '30', imageUrl: Imagesurls.A8A0487,),
                                BlogPost(title: 'ARTISANS', mainText: Companydata.blogDescription, date: 'September 08, 2024', comments: '15', imageUrl: Imagesurls.afs5,),
                              ],
                            )
                          ),
                        ),
                        Divider(
                          thickness: 20,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                  )
              ),
              Visibility(
                visible: isVisible(),
                child: const DesktopFooter(),
              ),
              Visibility(
                visible: isNotVisible(),
                child: const TabletFooter(),
              ),
            ],
           ),
          ),
        );
      },
    );
  }

}





