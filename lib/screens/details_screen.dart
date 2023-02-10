import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAddTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards(),
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.symmetric(vertical: 0),
        title: Text('Lucas Disney'),
        background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBnIv__Hq9sG3BiuVHNo8pTAcZYjK0cxsYGRafYbKnZK9TH-XVS-q-zZihbQG-JnKS6Bk&usqp=CAU')),
      ),
    );
  }
}

class _PosterAddTitle extends StatelessWidget {
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
          child: const FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzJM3ailUwp47AL2gPSwbFjtV75LH_KJq8zQ&usqp=CAU')),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                style: TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                'Movie-title'),
            const Text(
                style: TextStyle(fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                'Subtitle'),
            Row(
              children: const [
                Icon(
                  Icons.star_border_outlined,
                ),
                Icon(
                  Icons.star_border_outlined,
                ),
                Icon(
                  Icons.star_border_outlined,
                ),
                Icon(
                  Icons.star_border_outlined,
                ),
                Icon(
                  Icons.star_border_outlined,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(style: TextStyle(fontSize: 18), '7,0'),
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: const Text(
          textAlign: TextAlign.justify,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          'Duis non esse anim ut Lorem cupidatat ullamco eu amet. Duis non esse anim ut Lorem cupidatat ullamco eu amet. Duis non esse anim ut Lorem cupidatat ullamco eu amet. Duis non esse anim ut Lorem cupidatat ullamco eu amet.Duis non esse anim ut Lorem cupidatat ullamco eu amet. Duis non esse anim ut Lorem cupidatat ullamco eu amet.'),
    );
  }
}
