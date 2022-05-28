import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/movie_poster.dart';
import 'package:movie_theater/screens/select_movie/movie_title.dart';
import 'package:movie_theater/screens/select_movie/star_rating.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.index,
    required this.movie,
    required this.currentPage,
    required this.pageController,
    required this.animationValue,
    Key? key,
  }) : super(key: key);

  final int index;
  final Movie movie;
  final double currentPage;
  final PageController pageController;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    var diff = (currentPage - index).abs();
    const alphaMax = 255;
    var alpha = (alphaMax - (alphaMax * diff)).clamp(100, alphaMax).toInt();

    var offset = 0.0;
    if (diff == 1) {
      if (currentPage - index < 0) {
        offset -= animationValue;
      } else {
        offset += animationValue;
      }
    }
    return Transform.translate(
      offset: Offset(offset, 0),
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, _) {
          return Container(
            margin: EdgeInsets.only(left: 8, right: 8, top: diff * 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white.withAlpha(alpha),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                children: [
                  MoviePoster(image: movie.image),
                  MovieTitle(movie: movie),
                  SizedBox(height: 10),
                  StarRating(rating: movie.rating),
                  Text(
                    '...',
                    style: TextStyle(
                      height: 0.9,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
