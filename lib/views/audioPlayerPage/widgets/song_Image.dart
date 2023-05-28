import 'package:demo_app/app/constant/color.dart';
import 'package:demo_app/controller/song_controller.dart';
import 'package:demo_app/function/service/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

import 'package:just_audio/just_audio.dart';

class CustomSongImage extends StatefulWidget {
  const CustomSongImage({super.key});

  @override
  State<CustomSongImage> createState() => _CustomSongImageState();
}

class _CustomSongImageState extends State<CustomSongImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 8))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: getIt.get<SongController>().audioPlayer!.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final playing = playerState?.playing;

          if (playing != true) {
            _controller.stop();
          } else {
            _controller.repeat();
          }

          return Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: cdBgColor.withOpacity(0.5),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: Container(
                      margin: const EdgeInsets.all(50),
                      child: CircleAvatar(
                          child: const Icon(Icons.music_note_sharp),
                          foregroundImage: NetworkImage(
                            getIt
                                .get<SongController>()
                                .selectedSong!
                                .artworkUrl100,
                          )),
                    ));
              },
              child: const FlutterLogo(size: 200),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
