/*
https://api.themoviedb.org/3/movie/550?api_key=89b73283a6ad169f28fa16a9124da7df
https://api.themoviedb.org/3/list/1?api_key=89b73283a6ad169f28fa16a9124da7df&language=es-ES
https://api.themoviedb.org/3/discover/movie?api_key=89b73283a6ad169f28fa16a9124da7df&language=es-ES&sort_by=popularity.asc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
*/

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/query_search_movie.dart';

class MoviesProvider extends ChangeNotifier {
  List<ResultMovie> displayMovies = [];
  List<ResultMovie> popularMoviesData = [];
  Map<int, List<Cast>> castingActorsData = {};
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

  Future<List<Cast>> getCastingActors(int movieId) async {
    print('pidiendo info al server de $movieId');

    /* Logica para no hacer otra petición http nuevamente y mantener la data en memoria */
    if (castingActorsData.containsKey(movieId)) {
      return castingActorsData[movieId]!;
    }

    final datafromFunction =
        await _getJsonData('/3/movie/$movieId/credits', 'es-ES');
    // aqui tengo la data en JSON String tranquilamente pero en la siguiente linea me arroja null
    final data = CastingActors.fromRawJson(datafromFunction);
    castingActorsData[movieId] = data.cast;
    return data.cast;
  }

  Future<List<ResultMovie>> getSearchMovie(String query) async {
    final Uri url = Uri.https('api.themoviedb.org', '/3/search/movie', {
      'api_key': '89b73283a6ad169f28fa16a9124da7df',
      'language': 'es-ES',
      'page': '1',
      'query': query,
      'include_adult': 'false'
    });
    final response = await http.get(url);
    final data = QuerySearchMovie.fromRawJson(response.body);
    notifyListeners();
    return data.results;
  }
}
