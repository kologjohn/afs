import 'package:flutter/material.dart';

import '../blog/blog_post.dart';
import '../constanst.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.crossAxisCount,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7, // Adjust based on your design
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) {
        return BlogPost(
          title: 'TRENDING FASHIONS',
          mainText: Companydata.blogDescription,
          date: 'August 18, 2024',
          comments: '69',
          imageUrl: Imagesurls.A8A0463,
        );
      },
    );
  }
}