import 'package:demo_app/app/constant/color.dart';
import 'package:demo_app/function/service/locator.dart';
import 'package:demo_app/views/general_widgets/app_bar.dart';
import 'package:demo_app/views/general_widgets/background.dart';
import 'package:demo_app/views/general_widgets/text.dart';
import 'package:demo_app/views/songListPage/widgets/list_item.dart';
import 'package:demo_app/views/songListPage/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/controller/song_controller.dart';
import 'widgets/lang_button.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          actions: const [LangButton()],
        ),
        body: Column(
          children: [
            const CustomSearchBar(),
            Expanded(
              flex: 10,
              child: GetBuilder<SongController>(
                init: getIt.get<SongController>(),
                builder: (controller) {
                  if (controller.songControllerException != null) {
                    return TextButton(
                        onPressed: () async {
                          await controller.getSearchMusics();
                        },
                        child: Text("ErrMsg".tr));
                  }

                  if (controller.loading) {
                    return Center(
                        child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(40)),
                            padding: const EdgeInsets.all(12),
                            height: 40,
                            width: 40,
                            child: const CircularProgressIndicator()));
                  } else {
                    if (controller.songList == null ||
                        controller.songList!.isEmpty) {
                      return Center(
                        child: CustomText("EnterTermMsg".tr),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        await controller.getSearchMusics();
                      },
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.songList?.length ?? 0,
                          itemBuilder: (context, index) {
                            return CustomListItem(index: index);
                          }),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
