import 'package:flutter/material.dart';

class TheaterSeat extends StatefulWidget {
  const TheaterSeat({
    required this.scaleAnimation,
    this.onSelected,
    this.isTaken = true,
    Key? key,
  }) : super(key: key);

  final bool isTaken;
  final Animation<double> scaleAnimation;
  final void Function(bool selected)? onSelected;

  @override
  State<TheaterSeat> createState() => _TheaterSeatState();
}

class _TheaterSeatState extends State<TheaterSeat>
    with TickerProviderStateMixin {
  bool isSelected = false;
  late AnimationController animationController;
  late Animation<double> selectAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    selectAnimation = Tween<double>(begin: 1, end: 0.6).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var chairColor = widget.isTaken ? Color(0xff2C2B37) : Color(0xffB3B3C3);
    if (isSelected) {
      chairColor = Color(0xffF51933);
    }
    return ScaleTransition(
      scale: widget.scaleAnimation,
      child: ScaleTransition(
        scale: selectAnimation,
        child: Container(
          margin: EdgeInsets.only(top: 4),
          child: GestureDetector(
            onTap: () {
              if (!widget.isTaken) {
                setState(() {
                  isSelected = !isSelected;
                });
                animationController.forward().whenComplete(
                      () => animationController.reverse(),
                    );
                widget.onSelected?.call(isSelected);
              }
            },
            child: Icon(
              Icons.chair,
              color: chairColor,
              size: 23,
            ),
          ),
        ),
      ),
    );
  }
}
