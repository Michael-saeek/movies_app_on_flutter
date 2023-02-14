import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.titleMovie,
    required this.pathMovie,
  });

  final String titleMovie;
  final String pathMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //color: Colors.green,
          ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 130,
      height: 180,
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details',
              arguments: 'movie-slider'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
                width: double.infinity,
                height: 180,
                placeholder: const AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                image: NetworkImage(pathMovie)),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            titleMovie)
      ]),
    );
  }
}
