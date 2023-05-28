import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:demo_app/function/api/song_api.dart';
import 'package:demo_app/model/search_response.dart';
import 'package:demo_app/model/song.dart';

class SongController extends GetxController {
  List<SongModel>? _songList = [];
  String _term = "";
  bool _loading = false;
  int _selectedIndex = -1;
  AudioPlayer? _audioPlayer;
  double _sliderValue = 0.0;
  Exception? _apiException;

  List<SongModel>? get songList => _songList;
  String get term => _term;
  bool get loading => _loading;
  AudioPlayer? get audioPlayer => _audioPlayer;
  SongModel? get selectedSong =>
      _selectedIndex == -1 ? null : _songList![_selectedIndex];
  double get sliderValue => _sliderValue;
  Exception? get songControllerException => _apiException;
  set songList(List<SongModel>? value) {
    _songList = value;
    update();
  }

  set term(String value) => _term = value;

  Future<void> getSearchMusics() async {
    try {
      reset();
      startLoading();

      SearchResponseModel response = await SongAPI().getSearchMusics(_term);

      _songList = response.results;
      endLoading();
    } on Exception catch (e) {
      _apiException = e;
      update();
    }
  }

  set sliderValue(double value) {
    _sliderValue = value;
    update();
  }

  void reset() {
    _songList = null;
    sliderValue;
    _selectedIndex = -1;
    _apiException = null;
    update();
  }

  void startLoading() async {
    _loading = true;
    update();
  }

  void endLoading() async {
    _loading = false;
    update();
  }

  void setSongToPlayer(int index) async {
    try {
      if (_audioPlayer.isNull) _audioPlayer = AudioPlayer();
      await _audioPlayer!
        ..setUrl(_songList![index].previewUrl);

      _selectedIndex = index;
      update();
    } catch (e) {
      //  _audioPlayer = AudioPlayer();
      _selectedIndex = -1;
      print("Error loading audio source: $e");
    }
  }

  void nextSong() {
    try {
      if (_selectedIndex != -1 && _songList != null) {
        if (_selectedIndex + 1 <= (_songList!.length - 1)) {
          _selectedIndex++;
          setSongToPlayer(_selectedIndex);
        }
      }
    } catch (e) {}
  }

  void previousSong() {
    if (_selectedIndex != -1 && _songList != null) {
      if (_selectedIndex - 1 >= 0) {
        _selectedIndex--;
        setSongToPlayer(_selectedIndex);
      }
    }
  }
}
