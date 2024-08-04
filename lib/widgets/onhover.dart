import 'package:flutter/material.dart';

class HoverPopUpContainer extends StatefulWidget {
  final String imgPath;

  const HoverPopUpContainer({Key? key, required this.imgPath}) : super(key: key);

  @override
  _HoverPopUpContainerState createState() => _HoverPopUpContainerState();
}

class _HoverPopUpContainerState extends State<HoverPopUpContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _isHovered ? 250 : 200,  // Increased size when hovered
        height: _isHovered ? 250 : 200, // Increased size when hovered
        color: Colors.blue,
        child: Image.asset(
          widget.imgPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
