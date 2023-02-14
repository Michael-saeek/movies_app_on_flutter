// To parse this JSON data, do
//
//     final popularMovies = popularMoviesFromJson(jsonString);

import 'dart:convert';

class PopularMovies {
  PopularMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movies> results;
  int totalPages;
  int totalResults;

  factory PopularMovies.fromRawJson(String str) =>
      PopularMovies.fromJson(json.decode(str));

  factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        page: json["page"],
        results:
            List<Movies>.from(json["results"].map((x) => Movies.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Movies {
  Movies({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  dynamic backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  int popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  int voteAverage;
  int voteCount;

  getPathfullImage() {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory Movies.fromRawJson(String str) => Movies.fromJson(json.decode(str));

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
