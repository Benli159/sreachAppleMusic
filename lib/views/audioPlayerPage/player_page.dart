import 'package:demo_app/function/service/locator.dart';
import 'package:demo_app/views/audioPlayerPage/widgets/song_control_panel.dart';
import 'package:demo_app/views/general_widgets/app_bar.dart';
import 'package:demo_app/views/general_widgets/background.dart';
import 'package:demo_app/views/general_widgets/text.dart';
import 'package:demo_app/views/songListPage/widgets/lang_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/controller/song_controller.dart';
import 'widgets/song_Image.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            leading: IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.keyboard_arrow_down)),
          ),
          body: GetBuilder<SongController>(
              init: getIt.get<SongController>(),
              builder: (controller) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(child: CustomSongImage()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CustomText(
                              controller.selectedSong!.trackName,
                              textFormat: TextFormat.title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          CustomText(
                            controller.selectedSong!.artistName,
                            textFormat: TextFormat.subtitle,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 220,
                            child: SongControlPanel(),
                          )
                        ],
                      ),
                    )
                  ],
                );
              })),
    );
  }

  @override
  void dispose() {
    super.dispose();
/* when the player page is cloesd, the audio player will be stop */
    getIt.get<SongController>().audioPlayer!.stop();
  }
}
