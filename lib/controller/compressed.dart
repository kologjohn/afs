import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/shimmer.dart';
import '../widgets/featured_product.dart';
import 'dbfields.dart';

class PaginatedItemList extends StatefulWidget {
  @override
  _PaginatedItemListState createState() => _PaginatedItemListState();
}

class _PaginatedItemListState extends State<PaginatedItemList> {
  final int itemsPerPage = 20; // Number of items to load per page
  int currentPage = 0;
  List<QueryDocumentSnapshot> items = [];
  bool isLoading = false;
  bool hasMore = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchItems(); // Fetch the initial items
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _fetchItems() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    Query query = Dbfields.db.collection("items").orderBy(ItemReg.category).limit(itemsPerPage);

    // For the first page, we don't use startAfterDocument
    if (currentPage > 0) {
      query = query.startAfterDocument(items.last); // Only for subsequent pages
    }

    QuerySnapshot snapshot = await query.get();

    if (snapshot.docs.isEmpty) {
      hasMore = false; // No more items to load
    } else {
      items.addAll(snapshot.docs);
      currentPage++;
    }

    setState(() {
      isLoading = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              SizedBox(
                height: 1200,
                child: FutureBuilder<QuerySnapshot>(
                  future: Dbfields.db.collection("items").orderBy(ItemReg.category).limit(itemsPerPage).get(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerLoadingList();
                    } else if (snapshot.hasError) {
                      return const Text("Error Loading Data");
                    }

                    // Initially load the items here
                    if (currentPage == 0) {
                      items.addAll(snapshot.data!.docs);
                      currentPage++;
                    }

                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification.metrics.pixels ==
                            scrollNotification.metrics.maxScrollExtent) {
                          _fetchItems();
                        }
                        return true;
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0.6,
                          childAspectRatio: 0.7,
                          crossAxisCount: 5,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final fetchedData = items[index];
                          String itemname = fetchedData['item'];
                          String code = fetchedData['code'];
                          String url = fetchedData['itemurl'];
                          String sellingprice = fetchedData[ItemReg.sellingprice];

                          return FittedBox(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // await value.set_selecteditem(fetchedData[ItemReg.code]);
                                    // await value.get_current_item();
                                    // Navigator.pushNamed(context, Routes.singleProduct);
                                  },
                                  child: Container(
                                    width: 220,
                                    child: FeaturedProduct(
                                      frompage: "shop",
                                      featuredImage: url,
                                      featuredName: itemname,
                                      featuredPrice: sellingprice,
                                      image: CachedNetworkImage(
                                        errorListener: (rr) {},
                                        imageUrl: url,
                                        height: 200,
                                        width: 400,
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) => const Center(
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                      ),
                                      progress: false,
                                      consWidth: 300,
                                      featuredcode: code,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
