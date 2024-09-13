import 'package:flutter/material.dart';

import '../constanst.dart';

class BlogPost extends StatelessWidget {
  final String title;
  final String mainText;
  final String date;
  final String comments;
  final String imageUrl;

  const BlogPost({
    super.key, required this.title, required this.mainText, required this.date, required this.comments, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        //height: 600,
        //color: Colors.red,
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue[50],
              child: Image.asset(imageUrl, height: 300,width: 300,
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18,),
                  const SizedBox(width: 4),
                  Text(date),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      const Icon(Icons.comment, size: 18,),
                      const SizedBox(width: 4),
                      Text(comments)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Text(mainText,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}