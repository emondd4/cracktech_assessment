import 'package:hive/hive.dart';

import 'Movies.dart';

part 'LocalMovieListBaseResponse.g.dart';

@HiveType(typeId: 0)
class LocalMovieListBaseResponse extends HiveObject {

  @HiveField(0)
  List<String>? genres;
  @HiveField(1)
  List<Movies>? movies;

  LocalMovieListBaseResponse({
      this.genres, 
      this.movies,});

  LocalMovieListBaseResponse.fromJson(dynamic json) {
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['genres'] = genres;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}