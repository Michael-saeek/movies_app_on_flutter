import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
        title: const Center(child: Text('Peliculas en cine')),
      ),
      body: SingleChildScrollView(
          child: Column(children: const [CardSwiper(), MovieSlider()])),
    );
  }
}
