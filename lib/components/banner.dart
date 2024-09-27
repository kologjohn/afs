import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class FlashingBanner extends StatefulWidget {
  @override
  _FlashingBannerState createState() => _FlashingBannerState();
}

class _FlashingBannerState extends State<FlashingBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2)),
          ],
        ),
        child: Text(
          'Flash Sale! 50% Off on Selected Items!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}



class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  ImageCarousel({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}

