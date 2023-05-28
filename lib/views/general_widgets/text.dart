import 'package:demo_app/app/constant/color.dart';
import 'package:demo_app/app/constant/text_style.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text,
      {super.key,
      this.textFormat = TextFormat.content,
      this.textAlign = TextAlign.start});
  String text;
  TextFormat textFormat;
  late TextStyle textStyle;
  TextAlign textAlign;
  void setTextStyle() {
    switch (textFormat) {
      case TextFormat.title:
        textStyle = ourStyle(size: 24, color: whiteColor, bold: true);
        break;
      case TextFormat.subtitle:
        textStyle = ourStyle(size: 17, color: whiteColor, bold: true);
        break;
      default:
        textStyle = ourStyle();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    setTextStyle();

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

enum TextFormat { title, subtitle, content }
