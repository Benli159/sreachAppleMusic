import 'package:demo_app/app/constant/color.dart';
import 'package:demo_app/app/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends TextField {
  void Function(String value) onChanged;
  void Function(String value)? onSubmitted;
  String hint;
  IconData? icon;
  CustomTextInput(
      {required this.onChanged, this.onSubmitted, this.hint = "", this.icon})
      : super(
            maxLines: 1,
            style: ourStyle(size: 16),
            onSubmitted: onSubmitted,
            autofocus: false,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                isCollapsed: true,
                hintText: hint,
                icon: Icon(icon),
                prefixIconColor: whiteColor,
                filled: true,
                iconColor: whiteColor,
                fillColor: textInputFillColor.withOpacity(0.5),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none)),
            onChanged: onChanged);
}
