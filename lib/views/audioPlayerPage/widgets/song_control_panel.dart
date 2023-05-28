import 'package:demo_app/app/constant/color.dart';
import 'package:demo_app/controller/song_controller.dart';
import 'package:demo_app/views/audioPlayerPage/widgets/song_slide.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../function/service/locator.dart';

class SongControlPanel extends StatefulWidget {
  const SongControlPanel({super.key});

  @override
  State<SongControlPanel> createState() => _SongControlPanelState();
}

class _SongControlPanelState extends State<SongControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black.withOpacity(0.5),
      ),
      margin: const EdgeInsets.all(10),
      child: StreamBuilder<PlayerState>(
          stream: getIt.get<SongController>().audioPlayer!.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;

            final playing = playerState?.playing;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SongSlide(),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        splashRadius: 0.1,
                        onPressed: () =>
                            getIt.get<SongController>().previousSong(),
                        icon: const Icon(Icons.skip_previous_sharp),
                        iconSize: 50,
                        color: whiteColor,
                      ),
                      IconButton(
                        splashRadius: 0.1,
                        onPressed: playing != true
                            ? getIt.get<SongController>().audioPlayer!.play
                            : getIt.get<SongController>().audioPlayer!.pause,
                        icon: playing != true
                            ? const Icon(Icons.play_arrow_sharp)
                            : const Icon(Icons.pause_sharp),
                        color: whiteColor,
                        iconSize: 50,
                      ),
                      IconButton(
                        splashRadius: 0.1,
                        onPressed: () => getIt.get<SongController>().nextSong(),
                        icon: const Icon(Icons.skip_next_sharp),
                        color: whiteColor,
                        iconSize: 50,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
