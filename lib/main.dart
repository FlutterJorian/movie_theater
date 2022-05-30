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
              title: 'The Batman',
              image: 'the-batman.jpg',
              rating: 7.9,
              genres: ['Action', 'Crime', 'Drama'],
              description:
                  "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
              director: 'Matt Reeves',
              writers: ['Matt Reeves', 'Peter Craig', 'Bill Finger'],
              actors: ['Robert Pattinson', 'Zoë Kravitz', 'Jeffrey Wright'],
            ),
            Movie(
              title: 'The Northman',
              image: 'the-northman.jpg',
              rating: 7.4,
              genres: ['Action', 'Adventure', 'Drama'],
              description:
                  "From visionary director Robert Eggers comes The Northman, an action-filled epic that follows a young Viking prince on his quest to avenge his father's murder.",
              director: 'Robert Eggers',
              actors: ['Alexander Skarsgård', 'Nicole Kidman', 'Claes Bang'],
              writers: ['Sjón', 'Robert Eggers'],
            ),
            Movie(
              title: 'Joker',
              image: 'joker.jpg',
              rating: 8.4,
              genres: ['Crime', 'Drama', 'Thriller'],
              description:
                  'A mentally troubled stand-up comedian embarks on a downward spiral that leads to the creation of an iconic villain.',
              director: 'Todd Phillips',
              writers: ['Todd Phillips', 'Scott Silver', 'Bob Kane'],
              actors: ['Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz'],
            ),
            Movie(
              title: 'Avatar',
              image: 'avatar.jpg',
              rating: 7.2,
              genres: ['Action', 'Adventure', 'Sci-Fi'],
              description:
                  "Jake Sully lives with his newfound family formed on the planet of Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na'vi race to protect their planet.",
              director: 'James Cameron',
              writers: ['James Cameron', 'Josh Friedman'],
              actors: ['Michelle Yeoh', 'Zoe Saldana', 'Sam Worthington'],
            ),
            Movie(
              title: 'Prey',
              image: 'prey.jpg',
              rating: 6.8,
              genres: ['Action', 'Drama', 'Horror'],
              description:
                  'The origin story of the Predator in the world of the Comanche Nation 300 years ago. Naru, a skilled female warrior, fights to protect her tribe against one of the first highly-evolved Predators to land on Earth.',
              director: 'Dan Trachtenberg',
              actors: ['Amber Midthunder', 'Dane DiLiegro', 'Dakota Beavers'],
              writers: ['Patrick Aison'],
            ),
            Movie(
              title: 'The Flash',
              image: 'the-flash.jpg',
              rating: 7.1,
              genres: ['Action', 'Adventure', 'Fantasy'],
              description:
                  'Feature film based on the comic book superhero, The Flash.',
              director: 'Andy Muschietti',
              actors: ['Ben Affleck', 'Ezra Miller', 'Michael Keaton'],
              writers: ['Christina Hodson', 'Joby Harold'],
            ),
            Movie(
              title: 'Uncharted',
              image: 'uncharted.jpg',
              rating: 6.4,
              genres: ['Action', 'Adventure'],
              description:
                  'Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor "Sully" Sullivan to recover a fortune amassed by Ferdinand Magellan, and lost 500 years ago by the House of Moncada.',
              director: 'Ruben Fleischer',
              actors: ['Tom Holland', 'Mark Wahlberg', 'Antonio Banderas'],
              writers: ['Rafe Judkins', 'Art Marcum', 'Matt Holloway'],
            ),
            Movie(
              title: 'Memory',
              image: 'memory.jpg',
              rating: 5.6,
              genres: ['Action', 'thriller'],
              description:
                  "An assassin-for-hire finds that he's become a target after he refuses to complete a job for a dangerous criminal organization. A remake of the 2003 Belgian film 'The Memory of a Killer'.",
              director: 'Martin Campbell',
              actors: ['Liam Neeson', 'Guy Pearce', 'Taj Atwal'],
              writers: ['Dario Scardapane', 'Jef Geeraerts', 'Carl Joos'],
            ),
            Movie(
              title: 'Firestarter',
              image: 'firestarter.jpg',
              rating: 4.6,
              genres: ['Drama', 'Horror', 'Sci-Fi'],
              description:
                  'A young girl tries to understand how she mysteriously gained the power to set things on fire with her mind.',
              director: 'Keith Thomas',
              actors: ['Zac Efron', 'Ryan Kiera Armstrong', 'Sydney Lemmon'],
              writers: ['Stephen King', 'Scott Teems'],
            ),
            Movie(
              title: 'Ultrasound',
              image: 'ultrasound.jpg',
              rating: 5.5,
              genres: ['Drama', 'Mystery', 'Sci-Fi'],
              description:
                  'After his car breaks down, Glen spends one hell of an odd night with a married couple, setting into motion a chain of events that alter their lives plus those of several random strangers.',
              director: 'Rob Schroerder',
              actors: ['Vincent Kartheiser', 'Chelsea Lopez', 'Breeda Wool'],
              writers: ['Conor Stechschulte'],
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
