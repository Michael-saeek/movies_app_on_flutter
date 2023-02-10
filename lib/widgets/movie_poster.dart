import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
  });

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
            child: const FadeInImage(
                width: double.infinity,
                height: 180,
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6a9Ehhg9JriStUwS3bihRe57WTCkUQqstyeNZmXWKW5bSDyH7t0ZneS6i_I72EQBcoTM&usqp=CAU')),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            'Luca Disney Pixar')
      ]),
    );
  }
}
