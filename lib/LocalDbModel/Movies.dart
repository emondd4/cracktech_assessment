import 'package:hive/hive.dart';

part 'Movies.g.dart';


@HiveType(typeId: 1)
class Movies extends HiveObject{

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? year;
  @HiveField(3)
  String? runtime;
  @HiveField(4)
  List<String>? genres;
  @HiveField(5)
  String? director;
  @HiveField(6)
  String? actors;
  @HiveField(7)
  String? plot;
  @HiveField(8)
  String? posterUrl;

  Movies({
    this.id,
    this.title,
    this.year,
    this.runtime,
    this.genres,
    this.director,
    this.actors,
    this.plot,
    this.posterUrl,});


  Movies.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    director = json['director'];
    actors = json['actors'];
    plot = json['plot'];
    posterUrl = json['posterUrl'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year'] = year;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['director'] = director;
    map['actors'] = actors;
    map['plot'] = plot;
    map['posterUrl'] = posterUrl;
    return map;
  }

}