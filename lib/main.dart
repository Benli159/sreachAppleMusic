import 'package:demo_app/app/constant/color.dart';
import 'package:demo_app/app/locale/local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/function/route/page.dart';
import 'package:demo_app/function/service/locator.dart';

void main() {
  locator();
  Get.updateLocale(const Locale('zh', 'hk'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Localization(),
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('zh', 'HK'),
      getPages: AppRoutes.pages,
      initialRoute: "/listView",
      theme: ThemeData(primarySwatch: primaryColor),
    );
  }
}
