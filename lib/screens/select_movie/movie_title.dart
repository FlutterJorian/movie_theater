import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';

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
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            movie.title,
            style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.black.withOpacity(0.85),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: movie.genres
              .map(
                (genre) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(
                    genre,
                    style: const TextStyle(
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
