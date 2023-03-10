// To parse this JSON data, do
//
//     final castingActors = castingActorsFromJson(jsonString);

import 'dart:convert';

class CastingActors {
  CastingActors({
    required this.id,
    required this.cast,
  });

  int id;
  List<Cast> cast;

  factory CastingActors.fromRawJson(String str) =>
      CastingActors.fromJson(json.decode(str));

  factory CastingActors.fromJson(Map<String, dynamic> json) => CastingActors(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) {
          //    print(x);
          return Cast.fromJson(x);
        })),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    // required this.department,
    // required this.job,
  });

  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  // String department;
  // String job;

  getLinkImage() {
    if (profilePath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"] ?? '',
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        // department: json["department"],
        // job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        //  "department": department,
        //"job": job,
      };
}
