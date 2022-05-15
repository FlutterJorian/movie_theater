import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<String> movies = [
    'matrix.jpg',
    'fight-club.jpg',
    'pulp-fiction.jpg',
  ];
  PageController pageController = PageController();

  double view = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text('asdfasdf'),
          TextButton(
              onPressed: () {
                setState(() {
                  view = 1.0;
                });
              },
              child: Text('asdfasdfasdf')),
          Container(
            height: 200,
            child: Scrollable(
              // dragStartBehavior: widget.dragStartBehavior,
              axisDirection: AxisDirection.left,
              controller: pageController,
              //physics: physics,
              //restorationId: widget.restorationId,
              scrollBehavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return Viewport(
                  // TODO(dnfield): we should provide a way to set cacheExtent
                  // independent of implicit scrolling:
                  // https://github.com/flutter/flutter/issues/45632
                  //cacheExtent: widget.allowImplicitScrolling ? 1.0 : 0.0,
                  //cacheExtentStyle: CacheExtentStyle.viewport,
                  axisDirection: AxisDirection.left,
                  offset: position,
                  //clipBehavior: widget.clipBehavior,
                  slivers: <Widget>[
                    SliverFillViewport(
                      viewportFraction: view,
                      delegate: SliverChildBuilderDelegate(
                        childCount: movies.length,
                        (context, index) {
                          int currentPage = 0;
                          try {
                            currentPage = pageController.page!.toInt();
                          } catch (e) {}
                          return Container(
                            margin: index == currentPage
                                ? EdgeInsets.only(left: 20, right: 20)
                                : null,
                            child: Image.asset(
                              'assets/images/matrix.jpg',
                              width: 10,
                            ),
                            color: [
                              Colors.green,
                              Colors.red,
                              Colors.blue
                            ][index],
                            height: 200,
                            width: 10,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
