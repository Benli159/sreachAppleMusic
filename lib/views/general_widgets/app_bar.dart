import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends AppBar {
  List<Widget>? actions;
  Widget? leading;
  CustomAppBar({this.actions, this.leading})
      : super(
          leading: leading,
          actions: actions,
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
}
