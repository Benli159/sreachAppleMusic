import 'package:demo_app/app/constant/color.dart';
import 'package:flutter/material.dart';

TextStyle ourStyle(
    {double? size = 14, Color color = whiteColor, bool bold = false}) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal);
}
