import 'package:africanstraw/blog/blog_post.dart';
import 'package:flutter/material.dart';
import '../constanst.dart';
import '../widgets/post_blog.dart';
import '../widgets/recent_post.dart';

class BlogPage extends StatelessWidget {
  BlogPage({super.key});

  final searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 400.0;

    // Adjust crossAxisCount based on screen width
    int crossAxisCount = (screenWidth / itemWidth).floor();
    if (screenWidth <= 400) {
      crossAxisCount = 2;
    } else if (screenWidth <= 600 && screenWidth < 800) {
      crossAxisCount = (screenWidth / 400).floor();
    } else if (screenWidth >= 600 && screenWidth < 1000) {
      crossAxisCount = (screenWidth / 400).floor();
    }

    if (crossAxisCount <= 1) {
      crossAxisCount = 1;
    }

    bool isVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 1400;
    }
    bool isNotVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 1200;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Blog"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[50],
      ),
      body: Padding(
        padding: MediaQuery.of(context).size.width < 900
            ? const EdgeInsets.only(left: 5.0, right: 5.0, top: 50)
            : const EdgeInsets.only(left: 100.0, right: 100.0, top: 50),
        child: Row(
          children: [
            Visibility(
              visible: isVisible(),
              child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 400, minWidth: 400), // Limit width
                              child: Row(
                                children: [
                                  // Search Input
                                  Flexible(
                                    flex: 3,
                                    child: TextField(
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 16,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: const Icon(Icons.search, color: Colors.blue), // Search Icon
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside TextField
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30), // Rounded corners
                                          borderSide: BorderSide.none, // No visible border
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.blue,
                                              width: 1
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text("RECENT NEWS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20),
                      const RecentPost(title: 'TRENDING FASHION', date: 'October 02, 2024', imageUrl: 'assets/images/A8A0463.jpg',),
                      const SizedBox(height: 10),
                      const RecentPost(title: 'BOLGA ROUND BASKETS', date: 'October 01, 2024', imageUrl: 'assets/images/A8A0487.jpg',),
                      const SizedBox(height: 10),
                      const RecentPost(title: 'INTERIOR DECOR', date: 'September 28, 2024', imageUrl: 'assets/images/A8A0530.jpg',),
                      const SizedBox(height: 10),
                      const RecentPost(title: 'ARTISANS', date: 'September 20, 2024', imageUrl: 'assets/images/slide.jpg',),
                    ],
                  )
              ),
            ),
            Expanded(
              flex: 3,
                child: PostWidget(crossAxisCount: crossAxisCount)
            ),

          ],
        ),
      ),
    );
  }
}
