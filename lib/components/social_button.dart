import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'global.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final VoidCallback onPressed;
  const SocialButton({super.key, required this.iconPath, required this.label, this.horizontalPadding=40, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        width: 30,
      ),
      label: Text(label,
        style: const TextStyle(
          color: Global.backgroundColor,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding:  EdgeInsets.symmetric(vertical: 15, horizontal: horizontalPadding),
        shape:  RoundedRectangleBorder(
          side: const BorderSide(
            color: Global.borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
