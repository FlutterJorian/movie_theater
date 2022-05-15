import 'package:flutter/material.dart';
import 'package:movie_theater/screens/select_movie/select_movie.dart';

void main() {
  runApp(const MovieTheater());
}

class MovieTheaterRoute {
  static const String selectMovie = 'select_movie';

  static Map<String, Widget Function(BuildContext)> routes() => {
        selectMovie: (context) => SelectMovie(),
      };
}

class MovieTheater extends StatelessWidget {
  const MovieTheater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MovieTheaterRoute.routes(),
      initialRoute: MovieTheaterRoute.selectMovie,
    );
  }
}
