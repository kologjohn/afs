import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/controller/dbfields.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../constanst.dart';


class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final qty=TextEditingController();
  double rating = 3.0;
  @override
  Widget build(BuildContext context) {

    // final routeparam=ModalRoute.of(context)!.settings.arguments;
    // if (routeparam != null && routeparam is Map<String, dynamic>) {
    //   final Map<String, dynamic> args =routeparam as Map<String, dynamic>;
    //   itemamme=args['name'];
    // }
    // else
    //   {
    //     Navigator.pushNamed(context, Routes.dashboard);
    //   }

      return ProgressHUD(
        child: Consumer<Ecom>(
          builder: (BuildContext context, Ecom value, Widget? child) {
            qty.text=value.existingqty;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightGreen[50],
                centerTitle: true,
                title: Text(Companydata.companyname, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              ),
              body: StreamBuilder<QuerySnapshot>(
                  stream: value.db.collection("items").where('code', isEqualTo: value.selecteditem).snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return const Text("NO RECORD FOUND");
                    }
                    else if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return const Text("Please wait for Network");
                    }
                    String sprice=snapshot.data!.docs[0][ItemReg.sellingprice];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  color: Colors.white,
                                  elevation: 1,
                                  child: Container(
                                    width: 1050,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 10),
                                          Expanded(
                                              flex: 5,
                                              child: Wrap(
                                                spacing: 5,
                                                runSpacing: 5,
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                        color: Colors.brown.withOpacity(0.5),
                                                        height: 500,
                                                        width: 500,
                                                        child:CachedNetworkImage(
                                                          imageUrl:snapshot.data!.docs[0][ItemReg.itemurl],
                                                          imageBuilder: (context, imageProvider) => Container(
                                                            decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                image: imageProvider,
                                                                fit: BoxFit.contain,
                                                                // colorFilter: ColorFilter.mode(Colors.white, BlendMode.colorDodge)
                                                              ),
                                                            ),
                                                          ),
                                                          placeholder: (context, url) => Transform.scale(scale:0.4,child: const CircularProgressIndicator()),
                                                          errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,size: 40,),
                                                        )
                                                      // CachedNetworkImage(imageUrl: snapshot.data!.docs[0][ItemReg.itemurl],),
                                                    ),
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      color: Colors.white,
                                                      width: 500,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text(snapshot.data!.docs[0][ItemReg.item],
                                                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                                            ),
                                                            const SizedBox(height: 8),
                                                            Text(snapshot.data!.docs[0][ItemReg.category], style: const TextStyle(color: Global.mainColor),),
                                                            const SizedBox(height: 10),
                                                            Text(snapshot.data!.docs[0][ItemReg.description],
                                                              style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 20),
                                                            ),
                                                            const SizedBox(height: 10),
                                                            Container(
                                                              height: 200,
                                                              width: 500,
                                                              color: Colors.grey[200],
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(20.0),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text("${snapshot.data!.docs[0][ItemReg.sellingprice]} USD",
                                                                          style: TextStyle(
                                                                            //decoration: TextDecoration.lineThrough,
                                                                              fontSize: 25,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.brown[900]
                                                                          ),
                                                                        ),
                                                                        const SizedBox(width: 20),
                                                                         Text(
                                                                          "${double.parse(sprice)*1.2} USD",
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.lineThrough,
                                                                              fontSize: 14,
                                                                              color: Colors.black
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 10),
                                                                    const Row(
                                                                      children: [
                                                                        Icon(Icons.info_outline, size: 20, color: Colors.red,),
                                                                        SizedBox(width: 10),
                                                                        Text(
                                                                          "21 units left",
                                                                          style: TextStyle(
                                                                              color: Colors.red
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),

                                                                    const SizedBox(height: 10),
                                                                    SmoothStarRating(
                                                                      allowHalfRating: true,
                                                                      onRatingChanged: (value) {
                                                                        rating = value;
                                                                        setState(() {
                                                                          rating = value;
                                                                        });
                                                                        //print("Rating is $value stars");
                                                                      },
                                                                      starCount: 5,
                                                                      rating: rating,
                                                                      size: 20.0,
                                                                      filledIconData: Icons.star,
                                                                      halfFilledIconData: Icons.star_half,
                                                                      defaultIconData: Icons.star_border,
                                                                      color: Global.mainColor,
                                                                      borderColor: Global.mainColor,
                                                                      spacing:2.0,
                                                                    ),
                                                                    const SizedBox(height: 20),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                          "Quantity:",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold
                                                                          ),
                                                                        ),
                                                                        const SizedBox(width: 40),
                                                                        Container(
                                                                          height: 30,
                                                                          width: 30,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                  color: Colors.black,
                                                                                  width: 2
                                                                              )
                                                                          ),
                                                                          child: const Icon(Icons.remove),
                                                                        ),
                                                                        Container(
                                                                          width: 60,
                                                                          height: 30,
                                                                          decoration: BoxDecoration(
                                                                            border: Border.all(
                                                                              color: Colors.black,
                                                                              width: 2,
                                                                            ),
                                                                          ),
                                                                          child:  Center(
                                                                            child: TextField(
                                                                              controller: qty,
                                                                              textAlign: TextAlign.center,
                                                                              textAlignVertical: TextAlignVertical.center,
                                                                              decoration: InputDecoration(
                                                                                contentPadding: EdgeInsets.all(0),
                                                                                isDense: true,
                                                                                border: InputBorder.none,
                                                                              ),
                                                                              style: TextStyle(
                                                                                fontSize: 14, // Adjust the font size as needed
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height: 30,
                                                                          width: 30,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                  color: Colors.black,
                                                                                  width: 2
                                                                              )
                                                                          ),
                                                                          child: const Icon(Icons.add),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 20),
                                                            InkWell(
                                                              onTap: ()async{
                                                                final progress=ProgressHUD.of(context);
                                                                progress!.show();
                                                                String code=snapshot.data!.docs[0][ItemReg.code];
                                                                String name=snapshot.data!.docs[0][ItemReg.item];
                                                                String price=snapshot.data!.docs[0][ItemReg.sellingprice];
                                                                String des=snapshot.data!.docs[0][ItemReg.description];
                                                                String imageurl=snapshot.data!.docs[0][ItemReg.itemurl];
                                                                String quantity=qty.text;
                                                                value.cartids();
                                                                final savetocard=await value.addtocart("single",name, price, quantity, code,imageurl,des,context);
                                                                //print(savetocard);
                                                                if(savetocard[0]){
                                                                  SnackBar snackbar=const SnackBar(content: Text("Added to cart successfully",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
                                                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                }
                                                                else
                                                                {
                                                                    SnackBar snackbar= SnackBar(content: Text(savetocard[1],style: const TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
                                                                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                }

                                                                progress.dismiss();
                                                              },
                                                              child: Container(
                                                                  height: 40,
                                                                  width: 500,
                                                                  decoration: const BoxDecoration(
                                                                      color: Global.mainColor,
                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                  ),
                                                                  child: const Center(child: Text("ADD TO CART", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            );

          },
        ),
      );
  }
}
