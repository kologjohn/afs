import 'package:flutter/material.dart';
class TabletFeaturedProduct extends StatelessWidget {
  final String featuredImage;
  final String featuredName;
  final String featuredPrice;
  const TabletFeaturedProduct({
    super.key, required this.featuredImage, required this.featuredName, required this.featuredPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            width: 230,
            height: 200,
            color: Colors.lightBlue[50],
            child: Image.asset(featuredImage),
          ),
        ),
        Text(featuredName),
        Text('\$$featuredPrice', style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 18,),
            SizedBox(width: 10),
            Icon(Icons.shopping_cart_checkout, size: 18,),
            SizedBox(width: 10),
            Icon(Icons.shopping_cart,size: 18,),
          ],
        )
      ],
    );
  }
}
