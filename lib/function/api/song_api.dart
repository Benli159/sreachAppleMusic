import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:demo_app/model/search_response.dart';
import 'package:get/instance_manager.dart';

class SongAPI {
  Future<SearchResponseModel> getSearchMusics(String term) async {
    final dio = Dio();
    final res =
        await dio.get('https://itunes.apple.com/search', queryParameters: {
      'term': term.replaceAll(RegExp(r'\s+'), ' ').replaceAll(' ', '+'),
      'country': 'HK',
      'lang': 'zh-TW',
      'media': 'music'
    });
    dio.close();

    SearchResponseModel response =
        SearchResponseModel.fromJson(jsonDecode(res.data));
    print("getSearchMusics : ${response.toJson()}");
    return response;
  }
}
