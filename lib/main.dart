import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/select_movie.dart';

void main() {
  runApp(const MovieTheater());
}

class MovieTheaterRoute {
  static const String selectMovie = 'select_movie';

  static Map<String, Widget Function(BuildContext)> routes() => {
        selectMovie: (context) {
          final List<Movie> movies = [
            Movie(
              title: 'Matrix',
              image: 'matrix.jpg',
              rating: 9.0,
              genres: ['Action', 'Sci-Fi'],
            ),
            Movie(
              title: 'Fight Club',
              image: 'fight-club.jpg',
              rating: 9.0,
              genres: ['Drama'],
            ),
            Movie(
              title: 'Pulp Fiction',
              image: 'pulp-fiction.jpg',
              rating: 9.0,
              genres: ['Crime', 'Drama'],
            ),
          ];

          return SelectMovie(movies: movies);
        },
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
