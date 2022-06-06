import 'package:flutter/material.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/movie_description.dart';
import 'package:movie_theater/screens/select_movie/movie_poster.dart';
import 'package:movie_theater/screens/select_movie/movie_title.dart';
import 'package:movie_theater/screens/select_movie/star_rating_animated.dart';

class MovieCardAnimated extends StatelessWidget {
  const MovieCardAnimated({
    Key? key,
    required this.cardSize,
    required this.scrollController,
    required this.titleAnimation,
    required this.movie,
    required this.starsAnimations,
    required this.dotsAnimation,
    required this.descFadeInAnimation,
    required this.descTransformAnimation,
    required this.imageAnimation,
  }) : super(key: key);

  final double cardSize;
  final ScrollController scrollController;
  final Animation<double> titleAnimation;
  final Movie movie;
  final List<Animation<double>> starsAnimations;
  final Animation<double> dotsAnimation;
  final Animation<double> descFadeInAnimation;
  final Animation<double> descTransformAnimation;
  final Animation<double> imageAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: cardSize,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ScaleTransition(
                  scale: imageAnimation,
                  child: MoviePoster(image: movie.image),
                ),
                AnimatedBuilder(
                  animation: titleAnimation,
                  builder: (context, _) => Transform.translate(
                    offset: Offset(0, titleAnimation.value),
                    child: MovieTitle(
                      movie: movie,
                    ),
                  ),
                ),
                StarRatingAnimated(
                  starAnimations: starsAnimations,
                  rating: movie.rating,
                ),
                AnimatedBuilder(
                  animation: dotsAnimation,
                  builder: (context, _) => Transform.translate(
                    offset: Offset(0, 405),
                    child: Center(
                      child: Text(
                        '...',
                        style: TextStyle(
                          height: 0.9,
                          color: Colors.grey.shade800
                              .withOpacity(dotsAnimation.value),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: descFadeInAnimation,
                  builder: (context, _) => Opacity(
                    opacity: descFadeInAnimation.value,
                    child: AnimatedBuilder(
                      animation: descTransformAnimation,
                      builder: (context, _) => Transform.translate(
                        offset: Offset(0, 120 + descTransformAnimation.value),
                        child: MovieDescription(
                          movie: movie,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
