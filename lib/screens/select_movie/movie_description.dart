import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/avatar_page_view.dart';

class MovieDescription extends StatefulWidget {
  const MovieDescription({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  final PageController pageControllerActors =
      PageController(viewportFraction: 0.34);
  final PageController pageControllerWriters =
      PageController(viewportFraction: 0.34);

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 13,
    );
    var textStyleTitle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Director: ${widget.movie.director}',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Actors',
          style: textStyleTitle,
        ),
        const SizedBox(height: 20),
        AvatarPageView(
          pageController: pageControllerActors,
          names: widget.movie.actors,
        ),
        Text(
          'Introduction',
          style: textStyleTitle,
        ),
        const SizedBox(height: 15),
        Text(
          widget.movie.description,
          style: textStyle,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 40),
        Text(
          'Writers',
          style: textStyleTitle,
        ),
        const SizedBox(height: 20),
        AvatarPageView(
          pageController: pageControllerWriters,
          names: widget.movie.writers,
          flipColors: true,
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
