import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_theater/main.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/background_cards.dart';
import 'package:movie_theater/screens/select_movie/movie_card.dart';
import 'package:movie_theater/screens/select_movie/movie_description.dart';
import 'package:movie_theater/screens/select_movie/movie_poster.dart';
import 'package:movie_theater/screens/select_movie/movie_title.dart';
import 'package:movie_theater/screens/select_movie/star_rating_animated.dart';

class SelectMovie extends StatefulWidget {
  const SelectMovie({
    required this.movies,
    Key? key,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  State<SelectMovie> createState() => _SelectMovieState();
}

class _SelectMovieState extends State<SelectMovie>
    with TickerProviderStateMixin {
  final PageController pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.70,
  );
  double currentPage = 1.0;

  final ScrollController scrollController = ScrollController();
  double currentScrollOffset = 0.0;

  late AnimationController animationController1;
  late Animation<double> imageAnimation;
  late Animation<double> titleAnimation;
  List<Animation<double>> starsAnimations = [];
  Animation<double>? cardAnimation;
  late Animation<double> dotsAnimation;
  late Animation<double> leftRightCardAnimation;
  late Animation<double> descTransformAnimation;
  late Animation<double> descFadeInAnimation;

  late AnimationController animationController2;
  late Animation<double> bgCardLeftAnimation;
  late Animation<double> bgCardCenterAnimation;
  late Animation<double> bgCardRightAnimation;

  late AnimationController animationControllerTransition;
  Animation<double>? buttonWidthAnimation;
  late Animation<double> buttonScaleAnimation;
  Color buttonColor = Colors.grey.shade800;

  bool isPageViewEnabled = true;

  @override
  void initState() {
    pageController.addListener(setCurrentPage);
    scrollController.addListener(setCurrentScrollOffset);

    // Animation Controller 1
    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    imageAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.0, 0.4),
      ),
    )..addListener(animationListener);
    titleAnimation = Tween<double>(begin: 295, end: 0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.2, 0.8, curve: Curves.linear),
      ),
    )..addListener(animationListener);
    var starTween = Tween<double>(begin: 374, end: 79);
    var starCurve = Interval(
      0.2,
      1.0,
      curve: Cubic(.81, .87, .59, 1.18),
    );
    for (int i = 0; i < 5; i++) {
      var starAnimation = starTween.animate(
        CurvedAnimation(
          parent: animationController1,
          curve: Interval(
            i / 10 * 2,
            1.0,
            curve: starCurve,
          ),
        ),
      )..addListener(animationListener);
      starsAnimations.add(starAnimation);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cardAnimation =
          Tween<double>(begin: 200, end: MediaQuery.of(context).size.width)
              .animate(
        CurvedAnimation(
          parent: animationController1,
          curve: Interval(0.2, 0.8),
        ),
      )..addListener(animationListener);
    });
    dotsAnimation = Tween<double>(begin: 1, end: 0)
        .animate(animationController1)
      ..addListener(animationListener);
    leftRightCardAnimation = Tween<double>(begin: 0, end: 275).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.2, 0.8),
      ),
    )..addListener(animationListener);
    var interval = CurvedAnimation(
      parent: animationController1,
      curve: Interval(0.5, 1),
    );
    descTransformAnimation = Tween<double>(begin: 400, end: 0).animate(interval)
      ..addListener(animationListener);
    descFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(interval)
      ..addListener(animationListener);

    // Animation Controller 2
    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    var bgCardCurve = Curves.easeOutBack;
    var bgCardTween = Tween<double>(begin: 160, end: 0);
    bgCardLeftAnimation = bgCardTween.animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(
          0.2,
          1.0,
          curve: bgCardCurve,
        ),
      ),
    )..addListener(animationListener);
    bgCardCenterAnimation = bgCardTween.animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(
          0.0,
          1.0,
          curve: bgCardCurve,
        ),
      ),
    )..addListener(animationListener);
    bgCardRightAnimation = bgCardTween.animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(
          0.3,
          1.0,
          curve: bgCardCurve,
        ),
      ),
    )..addListener(animationListener);

    // Transition animations
    animationControllerTransition = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      buttonWidthAnimation =
          Tween<double>(begin: MediaQuery.of(context).size.width, end: 50)
              .animate(
        CurvedAnimation(
          parent: animationControllerTransition,
          curve: Interval(0, 0.5),
        ),
      )..addListener(animationListener);
    });
    buttonScaleAnimation = Tween<double>(begin: 1, end: 30).animate(
      CurvedAnimation(
        parent: animationControllerTransition,
        curve: Interval(0.6, 1.0),
      ),
    )..addListener(() {
        buttonColor = Colors.black;
        animationListener();
      });
    super.initState();
  }

  void animationListener() {
    setState(() {});
  }

  void setCurrentPage() {
    setState(() {
      currentPage = pageController.page!;
    });
  }

  void setCurrentScrollOffset() {
    setState(() {
      currentScrollOffset = scrollController.offset;
    });
  }

  @override
  void dispose() {
    pageController.removeListener(setCurrentPage);
    scrollController.removeListener(setCurrentScrollOffset);
    scrollController.dispose();
    pageController.dispose();
    animationController1.dispose();
    animationController2.dispose();
    animationControllerTransition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cardAnimationValue = cardAnimation?.value ?? 200;
    var pageIndex = currentPage.round();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (isPageViewEnabled) ...[
            AnimatedBuilder(
              animation: pageController,
              builder: (context, _) {
                return Viewport(
                  axisDirection: AxisDirection.left,
                  slivers: [
                    SliverFillViewport(
                      delegate: SliverChildBuilderDelegate(
                        childCount: widget.movies.length,
                        (context, index) {
                          return MoviePoster(
                            image: widget.movies[index].image,
                            isFullscreen: true,
                          );
                        },
                      ),
                    ),
                  ],
                  offset: ViewportOffset.fixed(
                    MediaQuery.of(context).size.width * currentPage,
                  ),
                );
              },
            ),
          ],
          if (!isPageViewEnabled &&
              (animationController2.isAnimating ||
                  animationController2.isCompleted)) ...[
            BackgroundCards(
              scrollController: scrollController,
              currentScrollOffset: currentScrollOffset,
              index: pageIndex,
              movies: widget.movies,
              bgCardCenterAnimationVal: bgCardCenterAnimation.value,
              bgCardLeftAnimationVal: bgCardLeftAnimation.value,
              bgCardRightAnimationVal: bgCardRightAnimation.value,
            )
          ],
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Colors.transparent,
                  Colors.white,
                ],
                stops: const [0.30, 0.75],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView.builder(
                  physics:
                      isPageViewEnabled ? null : NeverScrollableScrollPhysics(),
                  itemCount: widget.movies.length,
                  controller: pageController,
                  itemBuilder: (context, index) => MovieCard(
                    index: index,
                    movie: widget.movies[index],
                    currentPage: currentPage,
                    pageController: pageController,
                    animationValue: leftRightCardAnimation.value,
                  ),
                ),
                if (!isPageViewEnabled) ...[
                  Container(
                    width: cardAnimationValue,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Transform.scale(
                      scale: imageAnimation.value,
                      child: MoviePoster(
                        image: widget.movies[pageIndex].image,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(0, titleAnimation.value),
                            child: MovieTitle(
                              movie: widget.movies[pageIndex],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: StarRatingAnimated(
                              starAnimationValues: starsAnimations
                                  .map((star) => star.value)
                                  .toList(),
                              rating: widget.movies[pageIndex].rating,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, 402),
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
                          Opacity(
                            opacity: descFadeInAnimation.value,
                            child: Transform.translate(
                              offset:
                                  Offset(0, 115 + descTransformAnimation.value),
                              child: MovieDescription(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                if (animationController1.isAnimating ||
                    animationController2.isAnimating ||
                    animationControllerTransition.isAnimating) return;
                if (isPageViewEnabled) {
                  pageController.jumpToPage(pageIndex);
                  setState(() {
                    isPageViewEnabled = false;
                  });
                  animationController1.forward();
                  Future.delayed(
                    Duration(milliseconds: 300),
                    () => animationController2.forward(),
                  );
                } else {
                  animationControllerTransition.forward().whenComplete(
                        () => Navigator.pushReplacementNamed(
                          context,
                          MovieTheaterRoute.buyTicket,
                        ),
                      );
                  // animationController1.reset();
                  // animationController2.reset();
                  // setState(() {
                  //   isPageViewEnabled = true;
                  // });
                }
              },
              child: Transform.scale(
                scale: buttonScaleAnimation.value,
                child: Container(
                  width: !animationControllerTransition.isAnimating &&
                          !animationControllerTransition.isCompleted
                      ? cardAnimationValue + 20
                      : buttonWidthAnimation?.value ?? 220,
                  height: 50,
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(
                      !animationControllerTransition.isAnimating &&
                              !animationControllerTransition.isCompleted
                          ? 5
                          : 25,
                    ),
                  ),
                  child: !animationControllerTransition.isAnimating &&
                          !animationControllerTransition.isCompleted
                      ? Center(
                          child: Text(
                            'BUY TICKET',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
