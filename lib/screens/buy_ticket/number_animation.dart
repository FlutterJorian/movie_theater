import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NumberAnimation extends StatelessWidget {
  const NumberAnimation({
    required this.numberAnimation,
    this.hideZero = false,
    Key? key,
  }) : super(key: key);

  final Animation<double> numberAnimation;
  final bool hideZero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 9,
      child: AnimatedBuilder(
        animation: numberAnimation,
        builder: (context, _) {
          return Viewport(
            axisDirection: AxisDirection.down,
            slivers: [
              SliverFillViewport(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var num = index % 10;
                    return Text(
                      num == 0 && hideZero ? '' : num.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ],
            offset: ViewportOffset.fixed(numberAnimation.value),
          );
        },
      ),
    );
  }
}
