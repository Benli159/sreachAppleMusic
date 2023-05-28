import 'package:demo_app/controller/song_controller.dart';
import 'package:demo_app/function/route/page.dart';
import 'package:demo_app/function/service/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem({required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        getIt.get<SongController>().setSongToPlayer(index);

        Get.toNamed(AppLinks.PLAYER);
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          margin: const EdgeInsets.all(5),
          child: ListTile(
            title: Text(
              getIt.get<SongController>().songList![index].trackName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              getIt.get<SongController>().songList![index].artistName,
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                getIt.get<SongController>().songList![index].artworkUrl60,
              ),
              child: const Icon(Icons.music_note_sharp),
            ),
            trailing: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }
}
