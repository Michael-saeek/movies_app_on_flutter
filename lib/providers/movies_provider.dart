/*
https://api.themoviedb.org/3/movie/550?api_key=89b73283a6ad169f28fa16a9124da7df
https://api.themoviedb.org/3/list/1?api_key=89b73283a6ad169f28fa16a9124da7df&language=es-ES

https://api.themoviedb.org/3/discover/movie?api_key=89b73283a6ad169f28fa16a9124da7df&language=es-ES&sort_by=popularity.asc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
*/
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseurl = 'api.themoviedb.org';
  final String route = '/3/list/1';
  final String _apiKey = '89b73283a6ad169f28fa16a9124da7df';
  final String _language = 'es-ES';
  List<Item> displayMovies = [];
  List<Movies> popularMoviesData = [];

  MoviesProvider() {
    print('Clase constructor inicializada, mensaje desde la consola');

    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseurl, route, {
      'api_key': _apiKey,
      'language': _language,
    });

    /* La response que retorna esto seria un string*/
    final response = await http.get(url);

    /* Convertir la data a un Map*/

    // final decodedData = json.decode(response.body);
    final moviesListData = MoviesListResponse.fromRawJson(response.body);
    displayMovies = moviesListData.items;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie', {
      'api_key': '89b73283a6ad169f28fa16a9124da7df',
      'language': 'es-ES',
    });

    final response = await http.get(url);

    //final Map<String, dynamic> data = jsonDecode(response.body);
    final data = PopularMovies.fromRawJson(response.body);
    popularMoviesData = [...data.results];
    print(data);
    /*
    
    
  */
    notifyListeners();
  }
}
