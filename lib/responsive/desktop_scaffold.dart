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
import '../controller/controller.dart';
import '../widgets/featured_product.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/main_menu.dart';
import '../widgets/menu_type.dart';
import '../widgets/social_media_icons.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  String searchQuery="";

  var querysnapshot=Dbfields.db.collection("items").orderBy(ItemReg.category).limit(10).snapshots();
  String shoenum="";
  bool show=false;
  bool editShow=true;
  bool showoptions=false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 250.0;

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
          backgroundColor:  Colors.lightGreen[50],
          title:Container(
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
          actions: [
            options_menu(showoptionmenu: editShow, ecom: value,)
          ],
        ),
        backgroundColor: Colors.grey[200],
        body:  SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 130.0, right: 130.0, top: 15),
                  child: Container(
                    color: Colors.white,
                    //height: 10000,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
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
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                              onTap: (){
                                                Navigator.pushNamed(context, Routes.singleProduct);
                                              },
                                              child: const Icon(Icons.favorite)
                                          ),
                                          InkWell(
                                              onTap: ()async{
                                                await value.cartidmethod();
                                                final st=await value.alreadypaid(context);
                                                print(st);
                                                Navigator.pushNamed(context, Routes.cart);
                                              },
                                              child: const Icon(Icons.shopping_cart)
                                          ),
                                          Text("Total: USD ${value.mycarttotal}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                //color: Colors.white,
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
                                                FittedBox(
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
                                            child: StreamBuilder<QuerySnapshot>(
                                                stream: Dbfields.db.collection("category").snapshots(),
                                                builder: (context, snapshot) {
                                                  if(!snapshot.hasData){
                                                    return const Text("Loading...");
                                                  }
                                                  else if(snapshot.connectionState!=ConnectionState.active){
                                                    return const Text("Connection Error",style: TextStyle(color: Colors.red),);
                                                  }
                                                  else if(snapshot.data!.docs.isEmpty)
                                                  {
                                                    return const Text("Empty Baskets Category");
                                                  }
                                                  return ListView.builder(
                                                    scrollDirection: Axis.vertical,
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      String cate=snapshot.data!.docs[index]['name'];
                                                      return Container(child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                shoenum=cate;
                                                              });
                                                            },
                                                            child: InkWell(
                                                              onTap: (){
                                                                value.selected_category(cate);
                                                                Navigator.pushNamed(context, Routes.mainShop, arguments: {"cate":cate,"from":"desktop"});
                                                              },
                                                              child: MenuType(
                                                                  isSelected: false,
                                                                  coffeeType: cate
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(thickness: 1,color: Colors.grey[200],),
                                                          const SizedBox(height: 10),
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
                                    ],
                                  )
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
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
                                                      Expanded(
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
                                  const SizedBox(height: 20,),
                                  Padding(
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
                                                    padding: const EdgeInsets.only(left: 40.0),
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
                                                            Image.asset(Imagesurls.heritage5, height: 400,),
                                                            Image.asset(Imagesurls.heritage4, height: 400,),
                                                            Image.asset(Imagesurls.heritage1, height: 400,),
                                                            Image.asset(Imagesurls.heritage2, height: 400,),
                                                          ],
                                                          options: CarouselOptions(
                                                            aspectRatio: 16/9,
                                                            enlargeCenterPage: true,
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
                            child: StreamBuilder<QuerySnapshot>(
                              stream: Dbfields.db.collection("items").orderBy(ItemReg.category).orderBy('date').limit(8).snapshots(),
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                if(!snapshot.hasData){
                                  return const Text("Loading...");
                                }
                                else if(snapshot.connectionState==ConnectionState.waiting)
                                {
                                  const CircularProgressIndicator();
                                }
                                else if(snapshot.hasError)
                                {
                                  return const Text("Error Loading Data");
                                }
                                //urls.clear();
                               // myimage.clear();
                                var filteredDocs = snapshot.data!.docs.where((doc) {
                                  var data = doc.data() as Map<String, dynamic>;
                                  String item = data['item']?.toString().toLowerCase() ?? '';
                                  String category = data['category']?.toString().toLowerCase() ?? '';
                                  String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                                  return item.contains(searchQuery.toLowerCase()) || category.contains(searchQuery.toLowerCase() )||price.contains(searchQuery.toLowerCase());

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
                                  String url=fetchedData['itemurl'];
                                  String sellingprice=fetchedData[ItemReg.sellingprice];

                                  return FittedBox(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            // print(widget.name);
                                            Navigator.pushNamed(context, Routes.singleProduct,arguments: {"name":snapshot.data!.docs[index][ItemReg.code]});
                                          },
                                          child: Container(
                                            // height: 300,
                                            width: 220,
                                            child: FeaturedProduct(
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
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) => const Center(
                                                  child: SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                ),
                                                errorWidget: (context, url, error) =>Icon(Icons.error,color: Colors.red,),
                                              ),
                                              progress: false,
                                              consWidth: itemWidth,
                                            ),
                                          ),
                                        )
                                        // items[index]

                                      ],
                                    ),
                                  );
                                },);


                              },
                            )

                        ),

                        const SizedBox(height: 20),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 80),
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
                                                          fontSize: 20,
                                                      ),
                                                    ),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
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
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: SizedBox(
                                      height: 600,
                                      //color: Colors.red,
                                      child: Column(
                                        children: [
                                          Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.heritage4, height: 300,width: 300,),),
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
                                                Text("TRENDING FASHION", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                            child: Row(
                                              children: [
                                                Text(Companydata.blogDescription,
                                                  style: TextStyle(color: Colors.black54, fontSize: 12),
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
                                      height: 600,
                                      //color: Colors.red,
                                      child: Column(
                                        children: [
                                          Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.heritage5, height: 300,width: 300,),),
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
                                                Text("BOLGA ROUND BASKETS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                            child: Row(
                                              children: [
                                                Text(Companydata.blogDescription,
                                                  style: const TextStyle(color: Colors.black54, fontSize: 12),
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
                                      height: 600,
                                      //color: Colors.red,
                                      child: Column(
                                        children: [
                                          Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.heritage3, height: 300,width: 300,),),
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
                                                Text("INTERIOR DECOR", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                            child: Row(
                                              children: [
                                                Text(Companydata.blogDescription,
                                                  style: TextStyle(color: Colors.black54, fontSize: 12),
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
                        ),
                        Divider(
                          thickness: 20,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                height: 400,
                color: Colors.lightGreen[50],
                child:  Padding(
                  padding: const EdgeInsets.only(left: 130.0, right: 130, top: 50),
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
                                    Text(value.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                    const SizedBox(height: 20),
                                    Text("Address: ${value.companyaddress}"),
                                    const SizedBox(height: 15),
                                    Text("Phone: ${value.companyphone}"),
                                    const SizedBox(height: 15),
                                    Text("Email: ${value.companyemail}"),
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
        ),
      );
    },

    );
  }
}
