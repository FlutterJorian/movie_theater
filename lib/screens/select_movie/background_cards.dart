import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/movie_poster.dart';

class BackgroundCards extends StatelessWidget {
  const BackgroundCards({
    required this.scrollController,
    required this.currentScrollOffset,
    required this.index,
    required this.movies,
    required this.bgCardCenterAnimationVal,
    required this.bgCardLeftAnimationVal,
    required this.bgCardRightAnimationVal,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;
  final double currentScrollOffset;
  final int index;
  final List<Movie> movies;
  final double bgCardLeftAnimationVal;
  final double bgCardCenterAnimationVal;
  final double bgCardRightAnimationVal;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, _) {
        var width = 200.0;
        var marginTop = 130.0;
        if (currentScrollOffset < 0) {
          var offset = currentScrollOffset * -1;
          width += offset;
          marginTop += offset;
        }
        return Stack(
          children: [
            Transform.translate(
              offset: Offset(0, bgCardLeftAnimationVal),
              child: Container(
                margin: EdgeInsets.only(top: marginTop),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: MoviePoster(
                    image: movies[(index - 1) % movies.length].image,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, bgCardRightAnimationVal),
              child: Container(
                margin: EdgeInsets.only(top: marginTop),
                child: Align(
                  alignment: Alignment.topRight,
                  child: MoviePoster(
                    image: movies[(index + 1) % movies.length].image,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, bgCardCenterAnimationVal),
              child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: MoviePoster(
                    width: width,
                    image: movies[index].image,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
