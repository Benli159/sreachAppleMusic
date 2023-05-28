import 'package:demo_app/model/song.dart';

class SearchResponseModel {
  String? errorMessage = "";
  late int resultCount;
  late List<SongModel> results;

  SearchResponseModel(
      {this.errorMessage = "", this.resultCount = 0, this.results = const []});

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'] ?? null;
    resultCount = json['resultCount'];

    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(SongModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMessage'] = errorMessage;
    data['resultCount'] = resultCount;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
