import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class MovieSlider extends StatefulWidget {
  final List<Result> movies;
  final String titleCategory;
  final Function onNextPage;

  const MovieSlider({
    Key? key,
    required this.movies,
    required this.titleCategory,
    required this.onNextPage,
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      print(scrollController.position.pixels);

      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 500)) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        height: 300,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                widget.titleCategory)),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (context, int index) {
              final movie = widget.movies[index];
              return MoviePoster(
                  titleMovie: movie.title, pathImage: movie.getLinkImage());
            },
          ),
        )
      ]),
    );
  }
}
