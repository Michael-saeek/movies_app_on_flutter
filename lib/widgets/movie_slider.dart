import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key, required this.popularMovies}) : super(key: key);

  final List<Movies> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                'Populares')),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularMovies.length,
            itemBuilder: (context, int index) {
              final movies = popularMovies[index];
              return MoviePoster(
                pathMovie: movies.posterPath,
                titleMovie: movies.title,
              );
            },
          ),
        )
      ]),
    );
  }
}
