class SongModel {
  late String wrapperType = "";
  late String kind = "";
  late int trackId = -1;
  late String artistName = "";
  late String collectionName = "";
  late String trackName = "";
  late String collectionCensoredName = "";
  late String trackCensoredName = "";
  late String artistViewUrl = "";
  late String collectionViewUrl = "";
  late String trackViewUrl = "";
  late String previewUrl = "";
  late String artworkUrl30 = "";
  late String artworkUrl60 = "";
  late String artworkUrl100 = "";
  late String releaseDate = "";
  late String collectionExplicitness = "";
  late String trackExplicitness = "";
  late String country = "";
  late String currency = "";
  late String primaryGenreName = "";
  late bool isStreamable = false;

  SongModel(
      {this.wrapperType = "",
      this.trackId = -1,
      this.artistName = "",
      this.collectionName = "",
      this.trackName = "",
      this.collectionCensoredName = "",
      this.trackCensoredName = "",
      this.artistViewUrl = "",
      this.collectionViewUrl = "",
      this.trackViewUrl = "",
      this.previewUrl = "",
      this.artworkUrl30 = "",
      this.artworkUrl60 = "",
      this.artworkUrl100 = "",
      this.releaseDate = "",
      this.collectionExplicitness = "",
      this.trackExplicitness = "",
      this.country = "",
      this.currency = "",
      this.primaryGenreName = "",
      this.isStreamable = false});

  SongModel.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'] ?? "";
    kind = json['kind'] ?? "";
    trackId = json['trackId'] ?? -1;
    artistName = json['artistName'] ?? "";
    collectionName = json['collectionName'] ?? "";
    trackName = json['trackName'] ?? "";
    collectionCensoredName = json['collectionCensoredName'] ?? "";
    trackCensoredName = json['trackCensoredName'] ?? "";
    artistViewUrl = json['artistViewUrl'] ?? "";
    collectionViewUrl = json['collectionViewUrl'] ?? "";
    trackViewUrl = json['trackViewUrl'] ?? "";
    previewUrl = json['previewUrl'] ?? "";
    artworkUrl30 = json['artworkUrl30'] ?? "";
    artworkUrl60 = json['artworkUrl60'] ?? "";
    artworkUrl100 = json['artworkUrl100'] ?? "";
    releaseDate = json['releaseDate'] ?? "";
    collectionExplicitness = json['collectionExplicitness'] ?? "";
    trackExplicitness = json['trackExplicitness'] ?? "";

    country = json['country'] ?? "";
    currency = json['currency'] ?? "";
    primaryGenreName = json['primaryGenreName'] ?? "";
    isStreamable = json['isStreamable'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wrapperType'] = this.wrapperType;
    data['kind'] = this.kind;

    data['trackId'] = this.trackId;
    data['artistName'] = this.artistName;
    data['collectionName'] = this.collectionName;
    data['trackName'] = this.trackName;
    data['collectionCensoredName'] = this.collectionCensoredName;
    data['trackCensoredName'] = this.trackCensoredName;
    data['artistViewUrl'] = this.artistViewUrl;
    data['collectionViewUrl'] = this.collectionViewUrl;
    data['trackViewUrl'] = this.trackViewUrl;
    data['previewUrl'] = this.previewUrl;
    data['artworkUrl30'] = this.artworkUrl30;
    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl100'] = this.artworkUrl100;
    data['releaseDate'] = this.releaseDate;
    data['collectionExplicitness'] = this.collectionExplicitness;
    data['trackExplicitness'] = this.trackExplicitness;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['primaryGenreName'] = this.primaryGenreName;
    data['isStreamable'] = this.isStreamable;
    return data;
  }
}
