import 'package:demo_app/controller/song_controller.dart';
import 'package:demo_app/function/service/locator.dart';
import 'package:demo_app/views/general_widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SongSlide extends StatefulWidget {
  SongSlide({super.key});

  @override
  State<SongSlide> createState() => _SongSlideState();
}

class _SongSlideState extends State<SongSlide> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SongController>(
        init: getIt.get<SongController>(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                /*this stream listens audio player when playing or not  */
                if (controller.audioPlayer!.duration != null)
                  StreamBuilder<Duration>(
                    stream: controller.audioPlayer!.positionStream,
                    builder: (context, snapshot) {
                      final position = snapshot.data ?? Duration.zero;
                      /*when song is done, it will to next song */
                      if (controller.audioPlayer!.duration! <= position) {
                        controller.nextSong();
                      }
                      return Column(
                        children: [
                          Slider(
                            value: position.inSeconds.toDouble(),
                            min: 0.0,
                            max: controller.audioPlayer!.duration!.inSeconds
                                .toDouble(),
                            onChanged: (value) {
                              final position = Duration(seconds: value.toInt());
                              controller.audioPlayer!.seek(position);
                              controller.sliderValue = value;
                            },
                          ),
                          Container(
                            key: GlobalKey(),
                            child: CustomText(
                              '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} '
                              '/ '
                              '${controller.audioPlayer!.duration!.inMinutes}:${(controller.audioPlayer!.duration!.inSeconds % 60).toString().padLeft(2, '0')}',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
              ],
            ),
          );
        });
  }
}
