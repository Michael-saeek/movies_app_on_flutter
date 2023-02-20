import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultMovie movie =
        ModalRoute.of(context)?.settings.arguments as ResultMovie;
    print(movie.title);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          backdropPath: movie.getBackdropPath(),
          titleMovie: movie.title,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAddTitle(
                imgPath: movie.getLinkImage(),
                movieTitle: movie.title,
                originalTitle: movie.originalTitle,
                rating: movie.popularity),
            _Overview(descriptionMovie: movie.overview),
            const CastingCards(),
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final String backdropPath;
  final String titleMovie;

  const _CustomAppBar({required this.backdropPath, required this.titleMovie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        title: Text(titleMovie),
        background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(backdropPath)),
      ),
    );
  }
}

class _PosterAddTitle extends StatelessWidget {
  final String imgPath;
  final String movieTitle;
  final String originalTitle;
  final double rating;

  const _PosterAddTitle(
      {required this.imgPath,
      required this.movieTitle,
      required this.originalTitle,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.orange,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
              height: 150,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(imgPath)),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                movieTitle),
            Text(
                style: const TextStyle(fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                originalTitle),
            Row(
              children: [
                const Icon(
                  Icons.star_border_outlined,
                ),
                const Icon(
                  Icons.star_border_outlined,
                ),
                const Icon(
                  Icons.star_border_outlined,
                ),
                const Icon(
                  Icons.star_border_outlined,
                ),
                const Icon(
                  Icons.star_border_outlined,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(style: const TextStyle(fontSize: 18), rating.toString()),
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  final String descriptionMovie;

  const _Overview({required this.descriptionMovie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 200,
      child: Text(
          textAlign: TextAlign.justify,
          maxLines: 15,
          overflow: TextOverflow.ellipsis,
          descriptionMovie),
    );
  }
}
