import 'package:demo_app/controller/song_controller.dart';
import 'package:demo_app/views/general_widgets/text.dart';
import 'package:demo_app/views/general_widgets/text_iput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../function/service/locator.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "SearchMusic".tr,
            textFormat: TextFormat.subtitle,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CustomTextInput(
                      hint: "Search".tr,
                      icon: Icons.search,
                      onChanged: (value) =>
                          getIt.get<SongController>().term = value,
                      onSubmitted: (value) async =>
                          await getIt.get<SongController>().getSearchMusics(),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
