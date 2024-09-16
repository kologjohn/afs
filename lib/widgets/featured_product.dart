import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../controller/controller.dart';

class FeaturedProduct extends StatefulWidget {
  final String featuredImage;
  final String featuredName;
  final String featuredcode;
  final String featuredPrice;
  final String frompage;
  final bool progress;
  final double consWidth;
  final Widget image;

  const FeaturedProduct({
    super.key,
    required this.featuredImage,
    required this.featuredName,
    required this.featuredPrice,
    required this.progress,
    required this.image,
    required this.consWidth,
    required this.frompage, required this.featuredcode,
  });

  @override
  State<FeaturedProduct> createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  bool myProgress = false;
  bool cartShow = true;
  final numFormat = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(
      builder: (BuildContext context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: widget.consWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SizedBox(
                    width: widget.consWidth,
                    height: 200,
                    child: widget.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(widget.featuredName),
                              Text('\$${widget.featuredPrice}'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Visibility(
                            visible: cartShow,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      value.carttotal();
                                      value.item_alreadexist(value.cartidnumber, widget.featuredcode);
                                      setState(() {
                                        myProgress = true;
                                        cartShow = false;
                                      });

                                      final addCart = await value.addtocart(
                                        widget.frompage,
                                        widget.featuredName,
                                        widget.featuredPrice,
                                        "1",
                                        widget.featuredcode,
                                        widget.featuredImage,
                                        "",
                                        context,
                                      );

                                      if (value.error.isNotEmpty) {
                                        final snackBar = SnackBar(
                                          content: Text(
                                            value.error,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          backgroundColor: Colors.deepOrangeAccent,
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        setState(() {
                                          myProgress = false;
                                          cartShow = true;
                                        });
                                      } else if (addCart[0]) {
                                        final snackBar = SnackBar(
                                          content: Text(
                                            "${widget.featuredName} added successfully",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          backgroundColor: Colors.green,
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        setState(() {
                                          myProgress = false;
                                          cartShow = true;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      color: Colors.brown[200],
                                      child: const Center(
                                        child: Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: myProgress,
                            child: const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.brown,
                                strokeWidth: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
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
