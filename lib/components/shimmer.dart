import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,  // Number of placeholders you want to show
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: Container(
              width: 48.0,
              height: 48.0,
              color: Colors.white,
            ),
            title: Container(
              width: double.infinity,
              height: 10.0,
              color: Colors.white,
            ),
            subtitle: Container(
              width: double.infinity,
              height: 10.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
