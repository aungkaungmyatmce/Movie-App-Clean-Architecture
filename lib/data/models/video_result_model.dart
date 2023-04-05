import 'package:movie_app_clean_architecture/data/models/video_model.dart';

/// id : 577922
/// results : [{"iso_639_1":"en","iso_3166_1":"US","name":"Try And Keep Up: John David Washington and Travis Scott","key":"gxuT5yqZJh8","site":"YouTube","size":1080,"type":"Featurette","official":true,"published_at":"2020-11-24T18:59:48.000Z","id":"5fc8b9b3dcf87500423e2741"},{"iso_639_1":"en","iso_3166_1":"US","name":"Behind the Scenes Exclusive","key":"u0hCSxqnjT0","site":"YouTube","size":1080,"type":"Behind the Scenes","official":true,"published_at":"2020-08-26T16:10:48.000Z","id":"5f469fe9a8b2ca003887d9bc"},{"iso_639_1":"en","iso_3166_1":"US","name":"Final Trailer","key":"AZGcmvrTX9M","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2020-08-22T03:25:00.000Z","id":"5f40b3b8c175b200356128a3"},{"iso_639_1":"en","iso_3166_1":"US","name":"New Trailer","key":"L3pk_TBkihU","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2020-05-22T00:06:58.000Z","id":"5ec733c9ae2811001e3bb409"},{"iso_639_1":"en","iso_3166_1":"US","name":"Official Trailer","key":"LdOM0x0XDMo","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2019-12-19T16:59:42.000Z","id":"5dfbb4e565686e00158e85d3"}]

class VideoResultModel {
  VideoResultModel({
    this.id,
    this.videos,
  });

  VideoResultModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      videos = [];
      json['results'].forEach((v) {
        videos?.add(VideoModel.fromJson(v));
      });
    }
  }
  num? id;
  List<VideoModel>? videos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (videos != null) {
      map['results'] = videos?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
