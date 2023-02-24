// To parse this JSON data, do
//
//     final querySearchMovie = querySearchMovieFromJson(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class QuerySearchMovie {
  QuerySearchMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<ResultMovie> results;
  int totalPages;
  int totalResults;

  factory QuerySearchMovie.fromRawJson(String str) =>
      QuerySearchMovie.fromJson(json.decode(str));

  factory QuerySearchMovie.fromJson(Map<String, dynamic> json) =>
      QuerySearchMovie(
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
