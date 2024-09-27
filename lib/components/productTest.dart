import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ECommercePage extends StatefulWidget {
  @override
  _ECommercePageState createState() => _ECommercePageState();
}

class _ECommercePageState extends State<ECommercePage> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> _items = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMoreItems = true;


  @override
  void initState() {
    super.initState();
    _fetchItems(); // Initial data load
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchItems() async {
    if (_isLoading || !_hasMoreItems) return;

    setState(() {
      _isLoading = true;
    });

    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request('POST', Uri.parse('https://fetchitems-3tiooztrya-uc.a.run.app'));
      request.body = json.encode({
        "data": {"tid": "43456", "page": _page, "limit": 10}, // Send page number and limit
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());
        List<dynamic> fetchedItems = jsonResponse['result']['items'];

        setState(() {
          _items.addAll(fetchedItems);
          _page++;
          _hasMoreItems = fetchedItems.length == 10; // If less than 10 items, assume no more items
        });
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _fetchItems(); // Fetch more items when scrolled near bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 300.0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce Store'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount.ceil(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: _items.length + 1, // Add extra item for loading indicator
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  return _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox.shrink(); // Empty space if not loading
                }

                var item = _items[index];
                return ProductCard(
                  name: item['item'],
                  price: item['sellingprice'],
                  imageUrl: item['itemurl'],
                  code: item['code'],
                );
              },
            ),
          ),
          if (_isLoading) // Loading indicator at the bottom
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String code;

  ProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl:imageUrl,
            height: 300,
            fit: BoxFit.fill,
            errorListener: (context) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text('Price: \$$price'),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      addToCart(code);
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addToCart(String itemCode) {
    print('Item $itemCode added to cart!');
  }
}
