import 'package:flutter/material.dart';

class RecentPost extends StatelessWidget {

  final String title;
  final String date;
  final String imageUrl;

  const RecentPost({
    super.key, required this.title, required this.date, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Image.asset(imageUrl),
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 15),
            Text(date, style: const TextStyle(color: Colors.black54),
            ),
          ],
        )
      ],
    );
  }
}