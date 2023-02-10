import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

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
            itemCount: 10,
            itemBuilder: (context, int index) {
              return const MoviePoster();
            },
          ),
        )
      ]),
    );
  }
}
