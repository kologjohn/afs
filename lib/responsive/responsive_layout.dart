import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget isMobile;
  final Widget isTablet;
  final Widget isDesktop;
  const ResponsiveLayout({super.key, required this.isMobile, required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if (constraints.maxWidth < 500){
        return isMobile;
      } else if (constraints.maxWidth < 1200){
        return isTablet;
      } else {
        return isDesktop;
      }
    });
  }
}
