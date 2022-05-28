import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/buy_ticket/buy_ticket.dart';
import 'package:movie_theater/screens/select_movie/select_movie.dart';

void main() {
  // Flutter 3 bug (https://github.com/flutter/flutter/issues/101007) temp fix:
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(Duration(milliseconds: 200), () {
    runApp(const MovieTheater());
  });
}

class MovieTheaterRoute {
  static const String selectMovie = 'select_movie';
  static const String buyTicket = 'buy_ticket';

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
        buyTicket: (context) => BuyTicket(),
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
