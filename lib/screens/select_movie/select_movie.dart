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
    initialPage: 9999999,
    viewportFraction: 0.70,
  );
  double currentPage = 9999999;

  final ScrollController scrollController = ScrollController();
  double currentScrollOffset = 0.0;

  late AnimationController animationController1;
  late Animation<double> imageAnimation;
  late Animation<double> titleAnimation;
  List<Animation<double>> starsAnimations = [];
  Animation<double>? _cardAnimation;
  var cardSize = 200.0;
  late Animation<double> dotsAnimation;
  late Animation<double> leftRightCardAnimation;
  late Animation<double> descTransformAnimation;
  late Animation<double> descFadeInAnimation;

  late AnimationController animationController2;
  late Animation<double> bgCardLeftAnimation;
  late Animation<double> bgCardCenterAnimation;
  late Animation<double> bgCardRightAnimation;

  late AnimationController animationControllerTransition;
  Animation<double>? _buttonWidthAnimation;
  var buttonWidth = 220.0;
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
    );
    titleAnimation = Tween<double>(begin: 295, end: 0).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.2, 0.8, curve: Curves.linear),
      ),
    );
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
      );
      starsAnimations.add(starAnimation);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cardAnimation =
          Tween<double>(begin: 200, end: MediaQuery.of(context).size.width)
              .animate(
        CurvedAnimation(
          parent: animationController1,
          curve: Interval(0.2, 0.8),
        ),
      )..addListener(() => setState(() {
                cardSize = _cardAnimation!.value;
              }));
    });
    dotsAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController1);
    leftRightCardAnimation = Tween<double>(begin: 0, end: 275).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Interval(0.2, 0.8),
      ),
    );
    var interval = CurvedAnimation(
      parent: animationController1,
      curve: Interval(0.5, 1),
    );
    descTransformAnimation =
        Tween<double>(begin: 400, end: 0).animate(interval);
    descFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(interval);

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
    );
    bgCardCenterAnimation = bgCardTween.animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(
          0.0,
          1.0,
          curve: bgCardCurve,
        ),
      ),
    );
    bgCardRightAnimation = bgCardTween.animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Interval(
          0.3,
          1.0,
          curve: bgCardCurve,
        ),
      ),
    );

    // Transition animations
    animationControllerTransition = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _buttonWidthAnimation =
          Tween<double>(begin: MediaQuery.of(context).size.width, end: 50)
              .animate(
        CurvedAnimation(
          parent: animationControllerTransition,
          curve: Interval(0, 0.5),
        ),
      )..addListener(() => setState(() {
                buttonWidth = _buttonWidthAnimation!.value;
              }));
    });
    buttonScaleAnimation = Tween<double>(begin: 1, end: 30).animate(
      CurvedAnimation(
        parent: animationControllerTransition,
        curve: Interval(0.6, 1.0),
      ),
    )..addListener(() {
        buttonColor = Colors.black;
      });
    super.initState();
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
    var pageIndex = currentPage.round();
    var indexMovie = pageIndex % widget.movies.length;
    var movie = widget.movies[indexMovie];
    return WillPopScope(
      onWillPop: () async {
        back();
        return false;
      },
      child: Scaffold(
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
                          (context, index) {
                            var movieIndex = index % widget.movies.length;
                            return MoviePoster(
                              image: widget.movies[movieIndex].image,
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
                index: indexMovie,
                movies: widget.movies,
                bgCardCenterAnimation: bgCardCenterAnimation,
                bgCardLeftAnimation: bgCardLeftAnimation,
                bgCardRightAnimation: bgCardRightAnimation,
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
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.5),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView.builder(
                    physics: isPageViewEnabled
                        ? null
                        : NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemBuilder: (context, index) => AnimatedBuilder(
                        animation: leftRightCardAnimation,
                        builder: (context, _) {
                          var movieIndex = index % widget.movies.length;
                          return MovieCard(
                            index: index,
                            movie: widget.movies[movieIndex],
                            currentPage: currentPage,
                            pageController: pageController,
                            animationValue: leftRightCardAnimation.value,
                          );
                        }),
                  ),
                  if (!isPageViewEnabled) ...[
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ScaleTransition(
                        scale: imageAnimation,
                        child: MoviePoster(
                          image: movie.image,
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
                            AnimatedBuilder(
                              animation: titleAnimation,
                              builder: (context, _) => Transform.translate(
                                offset: Offset(0, titleAnimation.value),
                                child: MovieTitle(
                                  movie: movie,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: StarRatingAnimated(
                                starAnimations: starsAnimations,
                                rating: movie.rating,
                              ),
                            ),
                            AnimatedBuilder(
                              animation: dotsAnimation,
                              builder: (context, _) => Transform.translate(
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
                            ),
                            AnimatedBuilder(
                              animation: descFadeInAnimation,
                              builder: (context, _) => Opacity(
                                opacity: descFadeInAnimation.value,
                                child: AnimatedBuilder(
                                  animation: descTransformAnimation,
                                  builder: (context, _) => Transform.translate(
                                    offset: Offset(
                                        0, 115 + descTransformAnimation.value),
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
                    animationControllerTransition.forward().whenComplete(() {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => MovieTheaterRoute
                                  .routes()[MovieTheaterRoute.buyTicket]!
                              .call(_),
                        ),
                      ).whenComplete(
                        () {
                          animationControllerTransition.reverse().whenComplete(
                                () => buttonColor = Colors.grey.shade800,
                              );
                        },
                      );
                    });
                  }
                },
                child: ScaleTransition(
                  scale: buttonScaleAnimation,
                  child: Container(
                    width: !animationControllerTransition.isAnimating &&
                            !animationControllerTransition.isCompleted
                        ? cardSize + 20
                        : buttonWidth,
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
            Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: GestureDetector(
                onTap: back,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void back() {
    if (!isPageViewEnabled) {
      animationController2.reverse();
      Future.delayed(
        Duration(milliseconds: 300),
        () => animationController1.reverse().whenComplete(
              () => isPageViewEnabled = true,
            ),
      );
    }
  }
}
