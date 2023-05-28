import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangButton extends StatefulWidget {
  const LangButton({super.key});

  @override
  State<LangButton> createState() => _LangButtonState();
}

class _LangButtonState extends State<LangButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.language),
      onSelected: (int value) {
        setState(() {
          Get.updateLocale(value == 1
              ? const Locale('en', 'uk')
              : value == 2
                  ? const Locale("zh", "HK")
                  : const Locale('zh', 'cn'));
        });
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<int>>[
          PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              title: Text(
                'en_UK'.tr,
              ),
            ),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              title: Text(
                'zh_HK'.tr,
              ),
            ),
          ),
          PopupMenuItem<int>(
            value: 3,
            child: ListTile(
              title: Text(
                'zh_CN'.tr,
              ),
            ),
          ),
        ];
      },
    );
  }
}
