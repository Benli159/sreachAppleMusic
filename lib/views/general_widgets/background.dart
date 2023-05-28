import 'package:demo_app/app/constant/color.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({super.key, this.child});
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            bgDarkTopColor.withOpacity(0.8),
            bgDarkBottomColor.withOpacity(0.8)
          ])),
      child: child,
    );
  }
}
