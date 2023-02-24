import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearch extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_circle_left_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('build Results');
  }

  Widget _emptyWidget() {
    return const SizedBox(
      child: Center(
        child: Icon(
            size: 130, color: Colors.indigo, Icons.movie_creation_outlined),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyWidget();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getSearchMovie(query),
      builder: (_, AsyncSnapshot<List<ResultMovie>> snapshot) {
        print(snapshot);

        if (!snapshot.hasData) {
          return _emptyWidget();
        }

        final List<ResultMovie> data = snapshot.data!;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, int index) {
            final ResultMovie movie = data[index];
            return MovieListSearch(movie: movie);
          },
        );
      },
    );
  }
}

class MovieListSearch extends StatelessWidget {
  final ResultMovie movie;

  const MovieListSearch({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.getLinkImage()),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
