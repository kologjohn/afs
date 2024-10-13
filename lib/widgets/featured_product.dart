import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../controller/controller.dart';

class FeaturedProduct extends StatefulWidget {
  final String featuredImage;
  final String featuredName;
  final String featuredCode;
  final String featuredPrice;
  final String frompage;
  final bool progress;
  final double consWidth;
  final Widget image;
  final String dimension;
  final String weight;
  final Ecom ecom;

  const FeaturedProduct({
    super.key,
    required this.featuredImage,
    required this.featuredName,
    required this.featuredPrice,
    required this.progress,
    required this.image,
    required this.consWidth,
    required this.frompage,
    required this.featuredCode,
    required this.dimension,
    required this.weight, required this.ecom,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widget.consWidth,
        child: Column(
          children: [
            _buildImageSection(),
            _buildDetailsSection(widget.ecom, context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        color: Colors.lightBlue[50],
        width: widget.consWidth,
        height: 200,
        child: widget.image,
      ),
    );
  }

  Widget _buildDetailsSection(Ecom value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductDetails(),
              const SizedBox(height: 20),
              _buildCartButton(value, context),
              _buildProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.featuredName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text('Price: \$${widget.featuredPrice}'),
        const SizedBox(height: 5),
        Text('Size: ${widget.dimension}'),
        Text('Weight: ${widget.weight} kg'),
      ],
    );
  }

  Widget _buildCartButton(Ecom value, BuildContext context) {
    return Visibility(
      visible: cartShow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                setState(() {
                  myProgress = true;
                  cartShow = false;
                });

                value.carttotal();
                value.item_alreadexist(value.cartidnumber, widget.featuredCode);

                final addCart = await value.addtocart(
                  widget.frompage,
                  widget.featuredName,
                  widget.featuredPrice,
                  "1",
                  widget.featuredCode,
                  widget.featuredImage,
                  "",
                  widget.dimension,
                  widget.weight,
                  context,
                );

                _handleCartResponse(addCart, value, context);
              },
              child: Container(
                height: 25,
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
    );
  }

  Widget _buildProgressIndicator() {
    return Visibility(
      visible: myProgress,
      child: const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.brown,
          strokeWidth: 4,
        ),
      ),
    );
  }

  void _handleCartResponse(List<dynamic> addCart, Ecom value, BuildContext context) {
    if (value.error.isNotEmpty) {
      _showSnackBar(context, value.error, Colors.deepOrangeAccent);
    } else if (addCart[0]) {
      _showSnackBar(context, "${widget.featuredName} added successfully", Colors.green);
    }

    setState(() {
      myProgress = false;
      cartShow = true;
    });
  }

  void _showSnackBar(BuildContext context, String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
