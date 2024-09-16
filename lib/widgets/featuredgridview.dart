import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/widgets/route.dart';

import '../controller/dbfields.dart';
import 'featured_product.dart';
class featuredGridview extends StatefulWidget {
  final String shoenum;
  final double widgth;
  final double height;
  final double name;
  final double price;
  final double favHeight;
  final double favWidth;
  final double favSize;
  final double cartHeight;
  final double cartWidth;
  final double cartSize;
  final  querySnapshot;
  const featuredGridview({super.key, required this.shoenum, required this.widgth,required this.height, required this.name, required this.price, required this.favHeight, required this.favWidth, required this.favSize, required this.cartHeight, required this.cartWidth, required this.cartSize, required this.querySnapshot,});

  @override
  State<featuredGridview> createState() => _featuredGridviewState();
}

class _featuredGridviewState extends State<featuredGridview> {
  List<String> urls=[];
  List<Widget> myimage = [];

  //var itemData;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 280.0;
    int crossAxisCount=0;
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
    else
    {
      crossAxisCount = (screenWidth / itemWidth).floor();

    }
    if (crossAxisCount <= 1) {
      crossAxisCount = 1;
    }
   // List<Widget> items=[];
    // if(widget.shoenum.isNotEmpty)
    //   {
    //     String value=Ecom().capitalizeEachWord(widget.shoenum);
    //     print(value);
    //     setState(() {
    //       itemData=Dbfields.db.collection("items").orderBy(ItemReg.category).startAt([value]).snapshots();
    //     });
    //   }
    // else{
    //   itemData=Dbfields.db.collection("items").snapshots();
    // }
    return StreamBuilder<QuerySnapshot>(
      stream: widget.querySnapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasData)
        {
          urls.clear();
          myimage.clear();
          for(int i=0;i<snapshot.data!.docs.length;i++){
            //print(i);
            String url= snapshot.data!.docs[i][ItemReg.itemurl];
            urls.add(url);
            myimage.add(CachedNetworkImage(
              errorListener:(rr){
                //print("${name_txt} image are not uploaded yet");
              } ,
              imageUrl: url,
              height: 180,
              width: 180,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Image.asset("assets/images/profile.jpg"),

            ),);

            //print(url);


          }
          //return ;

        }
        else if(!snapshot.hasData){
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
        return GridView.builder(
          itemCount: urls.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
          crossAxisCount: crossAxisCount.ceil(),
        ), itemBuilder: (BuildContext context, int index) {
          return Container(child:Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              FittedBox(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        // print(widget.name);
                        Navigator.pushNamed(context, Routes.singleProduct,arguments: {"name":snapshot.data!.docs[index][ItemReg.code]});
                      },
                      child: Container(
                        // height: 300,
                        width: 200,
                        child: FeaturedProduct(

                          featuredImage:snapshot.data!.docs[index][ItemReg.itemurl],
                          featuredName: snapshot.data!.docs[index][ItemReg.item],
                          featuredPrice: snapshot.data!.docs[index][ItemReg.sellingprice],
                          progress: false,
                          image: myimage[index],
                          consWidth: 200, frompage: 'shop',
                          featuredcode: snapshot.data!.docs[index]['code'],
                        ),
                      ),
                    )
                    // items[index]

                  ],
                ),
              )
            ],
          ));
        },);
          // Wrap(
          // runSpacing: 5,
          // spacing: 5,
          // children: items
          // );

      },
    );
  }
}