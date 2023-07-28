class MovieListBaseResponse {
  MovieListBaseResponse({
      this.genres, 
      this.movies,});

  MovieListBaseResponse.fromJson(dynamic json) {
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }
  List<String>? genres;
  List<Movies>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['genres'] = genres;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Movies {
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
  int? id;
  String? title;
  String? year;
  String? runtime;
  List<String>? genres;
  String? director;
  String? actors;
  String? plot;
  String? posterUrl;

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