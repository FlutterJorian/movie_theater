import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/star_rating.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            movie.title,
            style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.black.withOpacity(0.85),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: movie.genres
              .map(
                (genre) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(
                    genre,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
