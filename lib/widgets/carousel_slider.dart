import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:africanstraw/controller/controller.dart';
import 'package:africanstraw/controller/dbfields.dart';
import 'package:africanstraw/widgets/slide_tile.dart';

class MyCarousel extends StatefulWidget {
  final bool enlargeCenter;
  final double viewPort;
  const MyCarousel({super.key, required this.enlargeCenter, required this.viewPort});
  @override
  State<MyCarousel> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<MyCarousel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Ecom().db.collection("items").snapshots(),
      builder: (context, snapshot) {
        List<Widget> widgets=[];
        if(!snapshot.hasData)
          {
            return const Text("No Items Uploaded");
          }
        else if(snapshot.hasData)
          {
            for(int i=0;i<snapshot.data!.docs.length;i++){
              widgets.add(
                SlideTile(
                    slideImagePath:  snapshot.data!.docs[i][ItemReg.itemurl],
                    slideName: snapshot.data!.docs[i][ItemReg.item],
                    slidePrice:  snapshot.data!.docs[i][ItemReg.sellingprice]
                ),
              );
            }
          }

        return CarouselSlider(
            options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                enlargeCenterPage: widget.enlargeCenter,
                viewportFraction: widget.viewPort
            ),
            items: widgets
            // const [
            //
            //   SlideTile(
            //       slideImagePath: "assets/images/chair.png",
            //       slideName: "Stuffing Chair",
            //       slidePrice: "500.00"
            //   ),
            //   SlideTile(
            //       slideImagePath: "assets/images/chair.png",
            //       slideName: "Stuffing Chair",
            //       slidePrice: "500.00"
            //   ),
            //   SlideTile(
            //       slideImagePath: "assets/images/chair.png",
            //       slideName: "Stuffing Chair",
            //       slidePrice: "500.00"
            //   ),
            //   SlideTile(
            //       slideImagePath: "assets/images/chair.png",
            //       slideName: "Stuffing Chair",
            //       slidePrice: "500.00"
            //   ),
            //   SlideTile(
            //       slideImagePath: "assets/images/chair.png",
            //       slideName: "Stuffing Chair",
            //       slidePrice: "500.00"
            //   ),
            // ]
        );
      }
    );
  }
}
