/*
https://api.themoviedb.org/3/movie/550?api_key=89b73283a6ad169f28fa16a9124da7df
https://api.themoviedb.org/3/list/1?api_key=89b73283a6ad169f28fa16a9124da7df&language=es-ES
https://api.themoviedb.org/3/discover/movie?api_key=89b73283a6ad169f28fa16a9124da7df&language=es-ES&sort_by=popularity.asc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
*/

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  List<ResultMovie> displayMovies = [];
  List<ResultMovie> popularMoviesData = [];
  int _popularPage = 0;

  MoviesProvider() {
    print('Clase constructor inicializada, mensaje desde la consola');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, String language,
      [int page = 1]) async {
    Uri url = Uri.https('api.themoviedb.org', endpoint, {
      'api_key': '89b73283a6ad169f28fa16a9124da7df',
      'language': language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    try {
      final datafromFunction =
          await _getJsonData('/3/movie/now_playing', 'es-ES');
      final moviesListData = PlayingMovies.fromRawJson(datafromFunction);
      displayMovies = moviesListData.results;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getPopularMovies() async {
    try {
      _popularPage++;
      print(_popularPage);
      final datafromFunction =
          await _getJsonData('/3/movie/popular', 'es-ES', _popularPage);
      final data = PopularMovies.fromRawJson(datafromFunction);
      popularMoviesData = data.results;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
