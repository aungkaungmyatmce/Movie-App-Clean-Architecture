import 'package:movie_app_clean_architecture/domain/entities/video_entity.dart';

/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// name : "Try And Keep Up: John David Washington and Travis Scott"
/// key : "gxuT5yqZJh8"
/// site : "YouTube"
/// size : 1080
/// type : "Featurette"
/// official : true
/// published_at : "2020-11-24T18:59:48.000Z"
/// id : "5fc8b9b3dcf87500423e2741"

class VideoModel extends VideoEntity {
  VideoModel({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    this.site,
    this.size,
    required this.type,
    this.official,
    this.publishedAt,
    this.id,
  }) : super(title: name, key: key, type: type);

  factory VideoModel.fromJson(dynamic json) {
    return VideoModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }
  String? iso6391;
  String? iso31661;
  String name;
  String key;
  String? site;
  num? size;
  String type;
  bool? official;
  String? publishedAt;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['published_at'] = publishedAt;
    map['id'] = id;
    return map;
  }
}
