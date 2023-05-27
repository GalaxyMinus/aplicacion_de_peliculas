import 'package:flutter/material.dart';

import '../models/models.dart';

// ignore: camel_case_types
class Movie_Slider extends StatefulWidget {
  const Movie_Slider(
      {Key? key, 
      required this.movies, 
      this.title,
      required this.onNextPage})
       : super(key: key);
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  @override
  State<Movie_Slider> createState() => _Movie_SliderState();
}

// ignore: camel_case_types
class _Movie_SliderState extends State<Movie_Slider> {
  final ScrollController scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    //ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) 
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title!,
              style: 
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => 
                  _MoviePoster(widget.movies[index])))
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => 
                Navigator.pushNamed(context, 'details',
                arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
  
}