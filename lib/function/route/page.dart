import 'package:get/get.dart';
import 'package:demo_app/views/audioPlayerPage/player_page.dart';
import 'package:demo_app/views/songListPage/list_view_page.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.LISTVIEWPAGE,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: AppLinks.PLAYER,
      transition: Transition.downToUp,
      page: () => PlayerPage(),
    ),
  ];
}

class AppLinks {
  static const String LISTVIEWPAGE = "/listView";
  static const String PLAYER = "/player";
}
