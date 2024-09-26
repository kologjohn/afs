import 'dart:math';

import 'package:africanstraw/components/shimmer.dart';
import 'package:africanstraw/footers/desktop_footer.dart';
import 'package:africanstraw/footers/tablet_footer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';
import '../controller/dbfields.dart';
import '../widgets/featured_product.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/main_menu.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/side_menu.dart';
import '../widgets/social_media_icons.dart';
import 'global.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool show=false;
  List<String> urls=[];
  List<Widget> myimage = [];
  String searchQuery = '';

  String shoenum="";
  List<bool> active=[];
  final searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 330.0;

    bool isVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 1200;
    }
    bool isNotVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 1200;
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

    return Consumer<Ecom>(
      builder: (BuildContext context, value, Widget? child) {
        if(value.selectedcategory.isNotEmpty){
          searchQuery=value.selectedcategory;
        }
        return Scaffold(
          appBar: AppBar(
            //toolbarHeight: 100,
            title: Visibility(
              visible: isVisible(),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.transparent,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            MainMenu()
                          ],
                        ),
                        const SizedBox(width: 120),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 400,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: searchController,
                                    onChanged: (txt){
                                      setState(() {
                                        searchQuery=txt;

                                      });
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Search by Item name,category or price?',
                                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                                        fillColor: Colors.white54,
                                        filled: true
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              color: Global.mainColor,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 120),
                        Row(
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.lightBlue[50],
            automaticallyImplyLeading: isNotVisible(),
          ),
          drawer: Visibility(
              visible: isNotVisible(),
              child: const SideDrawer(dWidth: 400)
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Visibility(
                            visible: isNotVisible(),
                            child: Column(
                              children: [
                                Container(
                                  
                                  child: Row(
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
                                                child:FutureBuilder<QuerySnapshot>(
                                                  future: value.db.collection("category").get(), // Fetch data from Firestore as a Future
                                                  builder: (context, snapshot) {
                                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                                      // Show a loading indicator while the data is being fetched
                                                      return ShimmerLoadingList();
                                                        //CircularProgressIndicator();

                                                    }

                                                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                                      // Handle the case when there's no data
                                                      return ShimmerLoadingList();
                                                    }

                                                    // If data is available, build the list
                                                    return ListView.builder(
                                                      itemCount: snapshot.data!.docs.length,
                                                      scrollDirection: Axis.vertical,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        String categoryName = snapshot.data!.docs[index]['name']; // Fetch category name from Firestore document

                                                        return InkWell(
                                                          onTap: () {}, // Define your onTap functionality here
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(4.0),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      value.selected_category(categoryName); // Handle category selection
                                                                      shoenum = categoryName; // Set the selected category
                                                                    });
                                                                  },
                                                                  child: MenuType(
                                                                    isSelected: false,
                                                                    coffeeType: categoryName, // Pass the category name to the MenuType widget
                                                                  ),
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 1,
                                                                color: Colors.grey[200],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                )

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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: isVisible(),
                                child: Expanded(
                                    child: SizedBox(
                                      height: 1200,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){},
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
                                          Container(
                                            color: Colors.white,
                                            height: 700,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                                              child: StreamBuilder<QuerySnapshot>(
                                                stream: Dbfields.db.collection("category").snapshots(),
                                                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                                                  if (!snapshot.hasData)
                                                  {
                                                    return ShimmerLoadingList();

                                                  }

                                                  return ListView.builder(
                                                    scrollDirection: Axis.vertical,
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      active.add(false);
                                                      String cate=snapshot.data!.docs[index]['name'];
                                                      return Container(child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                value.selected_category("");
                                                                searchQuery=cate;
                                                              });
                                                              // setState(() {
                                                              //   shoenum=Ecom().capitalizeSentence(cate);
                                                              //   querysnapshot=Dbfields.db.collection("items").where(ItemReg.category,isEqualTo: cate).snapshots();
                                                              //   if(active[index])
                                                              //   {
                                                              //     active.add(false);
                                                              //   } else{
                                                              //     active[index]=true;
                                                              //   }
                                                              //
                                                              // });
                                                            },
                                                            child: MenuType(
                                                                isSelected: active[index],
                                                                coffeeType: cate
                                                            ),
                                                          ),
                                                          Divider(thickness: 1,color: Colors.grey[200],),
                                                          const SizedBox(height: 10),
                                                        ],
                                                      ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        //color: Colors.lightGreen[50],
                                        height: 50,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Sort by",
                                                style: TextStyle(
                                                    fontSize: 15
                                                ),
                                              ),
                                              SizedBox(width: 60),
                                              Text(
                                                "Default",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 1200,
                                          child: StreamBuilder<QuerySnapshot>(
                                            stream: Dbfields.db.collection("items").orderBy(ItemReg.category).snapshots(),
                                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                              if(!snapshot.hasData){
                                                //return const Text("Loading...");
                                                return ShimmerLoadingList();

                                              }
                                              else if(snapshot.connectionState==ConnectionState.waiting)
                                              {
                                                return ShimmerLoadingList();

                                                // const CircularProgressIndicator();
                                              }
                                              else if(snapshot.hasError)
                                              {
                                                return const Text("Error Loading Data");
                                              }
                                              urls.clear();
                                              myimage.clear();
                                              var filteredDocs = snapshot.data!.docs.where((doc) {
                                                var data = doc.data() as Map<String, dynamic>;
                                                String item = data['item']?.toString().toLowerCase() ?? '';
                                                String category = data['category']?.toString().toLowerCase() ?? '';
                                                String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                                                if(value.selectedcategory.isNotEmpty){
                                                  return  category.contains(searchQuery.toLowerCase());

                                                }
                                                else
                                                {
                                                  return item.contains(searchQuery.toLowerCase()) || category.contains(searchQuery.toLowerCase() )||price.contains(searchQuery.toLowerCase());

                                                }

                                              }).toList();
                                              // for(int i=0;i<snapshot.data!.docs.length;i++){
                                              //   //print(i);
                                              //   String url= snapshot.data!.docs[i][ItemReg.itemurl];
                                              //   urls.add(url);
                                              //
                                              //   //print(url);
                                              //
                                              //
                                              // }
                                              return GridView.builder(
                                                itemCount: filteredDocs.length,
                                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisSpacing: 0.6,
                                                  childAspectRatio: 0.7,
                                                  crossAxisCount: crossAxisCount.ceil(),
                                                ), itemBuilder: (BuildContext context, int index) {
                                                final fetchedData = filteredDocs[index];
                                                String itemname=fetchedData['item'];
                                                String code=fetchedData['code'];
                                                String url=fetchedData['itemurl'];
                                                String sellingprice=fetchedData[ItemReg.sellingprice];

                                                return FittedBox(
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: ()async{
                                                          // print(widget.name);
                                                          await value.set_selecteditem(fetchedData[ItemReg.code]);
                                                          await value.get_current_item();
                                                          Navigator.pushNamed(context, Routes.singleProduct);
                                                        },
                                                        child: Container(
                                                          // height: 300,
                                                          width: 220,
                                                          child: FeaturedProduct(
                                                            frompage: "shop",
                                                            featuredImage:url,
                                                            featuredName: itemname,
                                                            featuredPrice: sellingprice,
                                                            image: CachedNetworkImage(
                                                              errorListener:(rr){
                                                                //print("${name_txt} image are not uploaded yet");
                                                              } ,
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
                                                              errorWidget: (context, url, error) =>const Icon(Icons.error,color: Colors.red,),

                                                            ),
                                                            progress: false,
                                                            consWidth: itemWidth,
                                                            featuredcode: code,
                                                          ),
                                                        ),
                                                      )
                                                      // items[index]

                                                    ],
                                                  ),
                                                );
                                              },);
                                              // Wrap(
                                              // runSpacing: 5,
                                              // spacing: 5,
                                              // children: items
                                              // );

                                            },
                                          )

                                        //featuredGridview(shoenum: shoenum, widgth: 300, height: 200, name: 16, price: 16, favHeight: 30, favWidth: 100, favSize: 25, cartHeight: 30, cartWidth: 100, cartSize: 25, querySnapshot: querysnapshot,),
                                      )
                                    ],
                                  )
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ),
                const SizedBox(height: 10),
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
