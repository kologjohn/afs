import 'dart:math';
import 'package:africanstraw/components/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../controller/cachedManager.dart';
import '../controller/controller.dart';
import '../controller/dbfields.dart';
import '../widgets/featured_product.dart';
import '../widgets/main_menu.dart';
import '../widgets/route.dart';
import '../widgets/side_menu.dart';
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
    double itemWidth = 400.0;

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
      crossAxisCount = (screenWidth / 300).floor();
    }
    else if(screenWidth >=600 && screenWidth<1000)
    {
      crossAxisCount = (screenWidth / 300).floor();

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
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       height: 50,
                      //       width: 400,
                      //       child: Column(
                      //         children: [
                      //           TextField(
                      //             controller: searchController,
                      //             onChanged: (txt){
                      //               setState(() {
                      //                 searchQuery=txt;
                      //
                      //               });
                      //             },
                      //             decoration: const InputDecoration(
                      //                 hintText: 'Search by Item name,category or price?',
                      //                 hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      //                 fillColor: Colors.white54,
                      //                 filled: true
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 50,
                      //       width: 150,
                      //       color: Global.mainColor,
                      //       child: const Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
            backgroundColor: Colors.lightBlue[50],
            automaticallyImplyLeading: isNotVisible(),
          ),
          drawer: Visibility(
              visible: isNotVisible(),
              child:  SideDrawer(dWidth: 400, value: value,)
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: MediaQuery.of(context).size.width < 700
                      ? const EdgeInsets.only(left: 5.0, right: 5.0, top: 15)
                      : const EdgeInsets.only(left: 30.0, right: 30.0, top: 15),
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          Visibility(
                            visible: true,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Wrap(
                                            runSpacing: 10,
                                            spacing: 10,
                                            alignment: WrapAlignment.spaceBetween,
                                            runAlignment: WrapAlignment.spaceBetween,
                                            children: [
                                              PopupMenuTheme(
                                                data: PopupMenuThemeData(
                                                  color: Colors.lightBlue[50],
                                                ),
                                                child: Container(
                                                  constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
                                                  color: Global.mainColor,
                                                  height: 50,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(Icons.menu, color: Colors.white),
                                                            const SizedBox(width: 8), // Spacing between icon and text
                                                            FutureBuilder<QuerySnapshot>(
                                                              future: value.db.collection("category").get(),
                                                              builder: (context, snapshot) {
                                                                if (!snapshot.hasData) {
                                                                  return const Text(
                                                                    "Loading...",
                                                                    style: TextStyle(color: Colors.white),
                                                                  );
                                                                }
                                                                return PopupMenuButton<String>(
                                                                  onSelected: (selectedCategory) {
                                                                    // Perform action based on selected category
                                                                    setState(() {
                                                                      value.selected_category(selectedCategory);
                                                                      shoenum = selectedCategory;
                                                                    });
                                                                  },
                                                                  itemBuilder: (BuildContext context) {
                                                                    return snapshot.data!.docs.map((DocumentSnapshot document) {
                                                                      String categoryName = document['name'];
                                                                      return PopupMenuItem<String>(
                                                                        value: categoryName,
                                                                        child: Text(categoryName),
                                                                      );
                                                                    }).toList();
                                                                  },
                                                                  child: const Text(
                                                                    "PRODUCT CATEGORIES",
                                                                    style: TextStyle(color: Colors.white),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        const Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 30,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(maxWidth: 400, minWidth: 400), // Limit width
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children inside the row
                                                  children: [
                                                    // Search Input
                                                    Flexible(
                                                      flex: 3,
                                                      child: TextField(
                                                        controller: searchController,
                                                        onChanged: (txt) {
                                                          setState(() {
                                                            searchQuery = txt;
                                                          });
                                                        },
                                                        decoration: InputDecoration(
                                                          hintText: 'Search for anything',
                                                          hintStyle: TextStyle(
                                                            color: Colors.grey[500],
                                                            fontSize: 16,
                                                          ),
                                                          fillColor: Colors.white,
                                                          filled: true,
                                                          suffixIcon: Icon(Icons.search, color: Colors.blue), // Search Icon
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside TextField
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30), // Rounded corners
                                                            borderSide: BorderSide.none, // No visible border
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                            borderSide: const BorderSide(
                                                                color: Colors.blue,
                                                                width: 1
                                                            ),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                            borderSide: BorderSide.none,
                                                          ),
                                                        ),
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1
                                                ),
                                              borderRadius: BorderRadius.circular(30)
                                            ),
                                            height: 30,
                                            width: 80,
                                              child: const Center(child: Text("Default")
                                              ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                              width: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1
                                                ),
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                              child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      //Text("Sort by"),
                                                      PopupMenuTheme(
                                                          data: PopupMenuThemeData(
                                                            color: Colors.lightBlue[50]
                                                          ),
                                                          child: PopupMenuButton<String>(
                                                            onSelected: (value) {
                                                              // Handle submenu item click
                                                              if (value == 'recent') {

                                                              } else if (value == 'lPrice') {

                                                              } else if (value == 'hPrice') {

                                                              } else if (value =='name') {

                                                              }
                                                            },
                                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                                              const PopupMenuItem<String>(
                                                                value: 'recent',
                                                                child: Text('Most Recent'),
                                                              ),
                                                              const PopupMenuItem<String>(
                                                                value: 'lPrice',
                                                                child: Text('Lowest Price'),
                                                              ),
                                                              const PopupMenuItem<String>(
                                                                value: 'hPrice',
                                                                child: Text('Highest Price'),
                                                              ),
                                                              const PopupMenuItem<String>(
                                                                  value: 'name',
                                                                  child: Text("Name")
                                                              ),
                                                            ],
                                                            child: Text("Sort by"),
                                                          ),
                                                      ),
                                                      const Icon(Icons.arrow_drop_down),
                                                    ],
                                                  )
                                              ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        // Item list
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1200,
                                child: FutureBuilder<QuerySnapshot>(
                                  future: Dbfields.db.collection("items").get(),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return ShimmerLoadingList();
                                    }
                                    if (snapshot.hasError) {
                                      return const Text("Error Loading Data");
                                    }

                                    // Clear the previous lists
                                    urls.clear();
                                    myimage.clear();

                                    var filteredDocs = snapshot.data!.docs.where((doc) {
                                      var data = doc.data() as Map<String, dynamic>;
                                      String item = data['item']?.toString().toLowerCase() ?? '';
                                      String category = data['category']?.toString().toLowerCase() ?? '';
                                      String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                                      // Filter logic
                                      if (value.selectedcategory.isNotEmpty) {
                                        return category.contains(searchQuery.toLowerCase());
                                      } else {
                                        return item.contains(searchQuery.toLowerCase()) ||
                                            category.contains(searchQuery.toLowerCase()) ||
                                            price.contains(searchQuery.toLowerCase());
                                      }
                                    }).toList();

                                    return GridView.builder(

                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: filteredDocs.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 0.6,
                                        childAspectRatio: 0.7,
                                        crossAxisCount: crossAxisCount.ceil(),
                                      ),
                                      itemBuilder: (BuildContext context, int index) {
                                        final fetchedData = filteredDocs[index];
                                        String itemname = fetchedData['item'];
                                        String code = fetchedData['code'];
                                        String url = fetchedData['itemurl'];
                                        String sellingprice = fetchedData[ItemReg.sellingprice];

                                        return FittedBox(
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await value.set_selecteditem(fetchedData[ItemReg.code]);
                                                  await value.get_current_item();
                                                  Navigator.pushNamed(context, Routes.singleProduct);
                                                },
                                                child: Container(
                                                  width: 220,
                                                  child: FeaturedProduct(
                                                    frompage: "shop",
                                                    featuredImage: url,
                                                    featuredName: itemname,
                                                    featuredPrice: sellingprice,
                                                    image: RepaintBoundary(
                                                      child: CachedNetworkImage(
                                                        errorListener: (val){
                                                          Text("Error:${val}");
                                                        },
                                                        cacheManager: CustomCacheManager(),
                                                        cacheKey: 'image_$index', // Ensures unique cache for each image
                                                        imageUrl: url,
                                                        imageBuilder: (context, imageProvider) => FadeInImage(
                                                          image: imageProvider,
                                                          placeholder: const AssetImage('assets/placeholder.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context, url, error) => const Icon(
                                                          Icons.error,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    progress: false,
                                                    consWidth: itemWidth,
                                                    featuredcode: code,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
