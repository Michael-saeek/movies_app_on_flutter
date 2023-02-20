// To parse this JSON data, do
//
//     final popularMovies = popularMoviesFromJson(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class PopularMovies {
  PopularMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<ResultMovie> results;
  int totalPages;
  int totalResults;

  factory PopularMovies.fromRawJson(String str) =>
      PopularMovies.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        page: json["page"],
        results: List<ResultMovie>.from(
            json["results"].map((x) => ResultMovie.fromJson(x))),
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
