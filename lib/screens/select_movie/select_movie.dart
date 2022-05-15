import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_theater/models/movie.dart';
import 'package:movie_theater/screens/select_movie/movie_card.dart';
import 'package:movie_theater/screens/select_movie/movie_description.dart';
import 'package:movie_theater/screens/select_movie/movie_poster.dart';
import 'package:movie_theater/screens/select_movie/movie_title.dart';
import 'package:movie_theater/screens/select_movie/star_rating.dart';

class SelectMovie extends StatefulWidget {
  const SelectMovie({Key? key}) : super(key: key);

  @override
  State<SelectMovie> createState() => _SelectMovieState();
}

class _SelectMovieState extends State<SelectMovie>
    with TickerProviderStateMixin {
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

  final PageController pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.70,
  );
  double currentPage = 1.0;

  final ScrollController scrollController = ScrollController();
  double currentScrollOffset = 0.0;

  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<double> imageAnimation;
  late Animation<double> titleAnimation;
  late Animation<double> cardAnimation;
  late Animation<double> descAnimation;
  late Animation<double> dotsAnimation;

  bool isPageViewEnabled = true;

  @override
  void initState() {
    pageController.addListener(setCurrentPage);
    scrollController.addListener(setCurrentScrollOffset);
    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController2.forward();
        }
      });
    imageAnimation =
        Tween<double>(begin: 0.5, end: 0).animate(animationController1)
          ..addListener(() {
            setState(() {});
          });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cardAnimation =
          Tween<double>(begin: 200, end: MediaQuery.of(context).size.width)
              .animate(animationController1)
            ..addListener(() {
              setState(() {});
            });
    });
    titleAnimation =
        Tween<double>(begin: 295, end: 0).animate(animationController1)
          ..addListener(() {
            setState(() {});
          });
    dotsAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController1)
          ..addListener(() {
            setState(() {});
          });

    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    descAnimation =
        Tween<double>(begin: 295, end: 0).animate(animationController2)
          ..addListener(() {
            setState(() {});
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        childCount: movies.length,
                        (context, index) {
                          return MoviePoster(
                            image: movies[index].image,
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
          if (!isPageViewEnabled) ...[
            AnimatedBuilder(
              animation: scrollController,
              builder: (context, _) {
                var width = 200.0;
                var marginTop = 130.0;
                if (currentScrollOffset < 0) {
                  var offset = currentScrollOffset * -1;
                  width += offset;
                  marginTop += offset;
                }
                var index = currentPage.toInt();
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: marginTop),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: MoviePoster(
                          image: movies[(index - 1) % movies.length].image,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: marginTop),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: MoviePoster(
                          image: movies[(index + 1) % movies.length].image,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: MoviePoster(
                          width: width,
                          image: movies[index].image,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
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
                stops: const [0.0, 0.75],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
            child: Stack(
              children: [
                PageView.builder(
                  physics:
                      isPageViewEnabled ? null : NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  controller: pageController,
                  itemBuilder: (context, index) => MovieCard(
                    index: index,
                    movie: movies[index],
                    currentPage: currentPage,
                    pageController: pageController,
                  ),
                ),
                if (!isPageViewEnabled) ...[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: cardAnimation.value,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: BouncingScrollPhysics(),
                          child: Stack(
                            //alignment: Alignment.center,
                            children: [
                              //if (!imageAnimation.isCompleted) ...[
                              Transform.scale(
                                scale: imageAnimation.value,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: MoviePoster(
                                    image: movies[currentPage.toInt()].image,
                                  ),
                                ),
                              ),
                              // ],
                              Transform.translate(
                                offset: Offset(0, titleAnimation.value),
                                child: MovieTitle(
                                  movie: movies[currentPage.toInt()],
                                ),
                              ),

                              Transform.translate(
                                offset: Offset(0, 295),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: StarRating(
                                      rating:
                                          movies[currentPage.toInt()].rating),
                                ),
                              ),

                              Transform.translate(
                                offset: Offset(0, 295),
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

                              SizedBox(height: 10),
                              Transform.translate(
                                offset: Offset(0, 170 + descAnimation.value),
                                child: MovieDescription(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                if (isPageViewEnabled) {
                  setState(() {
                    isPageViewEnabled = false;
                  });
                  animationController1.forward();
                } else {
                  animationController2.reverse();
                  animationController1.reverse();

                  setState(() {
                    isPageViewEnabled = true;
                  });
                }
              },
              child: Container(
                width: 450,
                height: 45,
                margin: EdgeInsets.only(left: 80, right: 80, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'BUY TICKET',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
