import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:demo_app/controller/song_controller.dart';

final GetIt getIt = GetIt.instance;

void locator() {
  getIt.registerSingleton<SongController>(SongController());
}
