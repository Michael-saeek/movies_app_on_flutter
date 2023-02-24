import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int castingId;
  const CastingCards(this.castingId, {super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: movieProvider.getCastingActors(castingId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        // sino tiene data muestra un circularLoading
        if (!snapshot.hasData) {
          return const SizedBox(
              width: double.infinity,
              height: 150,
              child: Center(child: CircularProgressIndicator()));
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          width: double.infinity,
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, int index) {
              final Cast actor = cast[index];

              return Container(
                width: 130,
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const AssetImage('assets/loading.gif'),
                            image: NetworkImage(actor.getLinkImage())),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(actor.originalName),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
