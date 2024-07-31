import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_network/image_network.dart';

class SlideTile extends StatelessWidget {
  final String slideImagePath;
  final String slideName;
  final String slidePrice;

  const SlideTile({super.key, required this.slideImagePath, required this.slideName, required this.slidePrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRect(
          //   child: CachedNetworkImageBuilder(
          //     errorWidget: Text("Error Images"),
          //     placeHolder: Text("NO IMAGE YET"),
          //     url: slideImagePath,
          //     builder: (imageFile) {
          //       return Center(child: Image.file(imageFile));
          //     },
          //   ),
          // ),
          //coffee image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            //child:Image(image: CachedNetworkImageProvider(slideImagePath))
            // CachedNetworkImage(
            //   imageUrl: slideImagePath,
            //   placeholder: (context, url) => const CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            // ),

            //Image(image: NetworkImage(slideImagePath),width: 100,height: 100,)
            child:ImageNetwork(image: slideImagePath, height: 100, width: 100,fitWeb: BoxFitWeb.cover,),
          ),
          //coffee name
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slideName,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 2,),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5,),
          //coffee price
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$slidePrice'),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
