import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'localization_cn.dart';
import 'localization_en.dart';
import 'localization_zh.dart';

class Localization extends Translations {
  static String currentLangange(
      {String zh = "", String cn = "", String en = ""}) {
    if (Get.locale == Locale("zh", "HK"))
      return zh;
    else if (Get.locale == Locale("zh", "CN"))
      return cn;
    else
      return en;
  }

  static Map<Locale, Map<String, String>> localizedValues = {
    Locale("en", "UK"): LocalizatedValueEn.dict,
    Locale("zh", "HK"): LocalizatedValueZh.dict,
    Locale("zh", "CN"): LocalizatedValueCn.dict,
  };

  @override
  Map<String, Map<String, String>> get keys =>
      localizedValues.map((key, value) =>
          MapEntry("${key.languageCode}_${key.countryCode}", value));
}

abstract class Name {
  String getName(String zh, String cn, String en) =>
      Get.locale!.languageCode == "en"
          ? en
          : Get.locale!.countryCode == "HK"
              ? zh
              : cn;
}
