import 'package:flutter/material.dart';
import 'package:aplicacion_de_peliculas/providers/movie_provider.dart';
import 'package:aplicacion_de_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';


// ignore: camel_case_types
class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                context: context, 
                delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ), 
            Movie_Slider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            )
            ],
        ),
      ));
  }
  
}