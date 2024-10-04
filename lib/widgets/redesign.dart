import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RedesignedCartItem extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final String description;
  final String price;
  final bool inStock;
  final Function onRemove;
  final Widget quantityControl;

  RedesignedCartItem({
    required this.imageUrl,
    required this.itemName,
    required this.description,
    required this.price,
    required this.inStock,
    required this.onRemove,
    required this.quantityControl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isMobile = screenWidth < 600;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image Section
                  Container(
                    width: isMobile ? screenWidth * 0.3 : 200,
                    height: isMobile ? 150 : 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown[100],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                          child: Transform.scale(
                            scale: 0.4,
                            child: const CircularProgressIndicator(),
                          )),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Product Details Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item Name
                        Text(
                          itemName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 10),

                        // Item Description
                        Text(
                          description,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),

                        // Price
                        Text(
                          "USD $price",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),

                        // Stock Availability and Actions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Stock Status
                            Text(
                              inStock ? "In Stock" : "Out of Stock",
                              style: TextStyle(
                                  color: inStock
                                      ? Colors.green
                                      : Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),

                            // Quantity Control and Remove Button
                            Row(
                              children: [
                                quantityControl,
                                const SizedBox(width: 16),

                                // Remove Button
                                TextButton.icon(
                                  onPressed: () => onRemove(),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  label: const Text(
                                    "Remove",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Example Cart Item
          RedesignedCartItem(
            imageUrl: 'https://via.placeholder.com/300',
            itemName: 'Product 1',
            description: 'This is a product description',
            price: "59.99",
            inStock: true,
            onRemove: () {
              // Handle remove item logic here
            },
            quantityControl: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Handle quantity decrement
                  },
                ),
                const Text(
                  '1',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Handle quantity increment
                  },
                ),
              ],
            ),
          ),
          // Additional cart items can be added here
        ],
      ),
    );
  }
}
