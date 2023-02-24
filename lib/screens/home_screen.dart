import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/search/search_delegate.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MovieSearch());
              },
              icon: const Icon(Icons.search_outlined))
        ],
        title: const Center(child: Text('Peliculas en cine')),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        CardSwiper(movies: moviesProvider.popularMoviesData),
        MovieSlider(
          movies: moviesProvider.popularMoviesData,
          titleCategory: 'Populares',
          onNextPage: () {
            moviesProvider.getPopularMovies();
          },
        ),
      ])),
    );
  }
}
