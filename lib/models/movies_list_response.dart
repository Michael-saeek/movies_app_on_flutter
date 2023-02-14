// To parse this JSON data, do
//
//     final MoviesListResponse = welcomeFromJson(jsonString);

import 'dart:convert';

class MoviesListResponse {
  MoviesListResponse({
    required this.createdBy,
    required this.description,
    required this.favoriteCount,
    required this.id,
    required this.items,
    required this.itemCount,
    required this.name,
    required this.posterPath,
  });

  String createdBy;
  String description;
  int favoriteCount;
  String id;
  List<Item> items;
  int itemCount;
  String name;
  String posterPath;

  getLinkImage() {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory MoviesListResponse.fromRawJson(String str) =>
      MoviesListResponse.fromJson(json.decode(str));

  factory MoviesListResponse.fromJson(Map<String, dynamic> json) =>
      MoviesListResponse(
        createdBy: json["created_by"],
        description: json["description"],
        favoriteCount: json["favorite_count"],
        id: json["id"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        itemCount: json["item_count"],
        //    iso6391: iso6391Values.map[json["iso_639_1"]],
        name: json["name"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "created_by": createdBy,
        "description": description,
        "favorite_count": favoriteCount,
        "id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "item_count": itemCount,
        "name": name,
        "poster_path": posterPath,
      };
}

class Item {
  Item({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
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
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  //https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
  getLinkImage() {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));
  factory Item.fromJson(Map<String, dynamic> json) => Item(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
