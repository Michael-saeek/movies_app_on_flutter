import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      width: double.infinity,
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, int index) {
          return Container(
            width: 130,
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/loading.gif'),
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzJM3ailUwp47AL2gPSwbFjtV75LH_KJq8zQ&usqp=CAU')),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Actor')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
