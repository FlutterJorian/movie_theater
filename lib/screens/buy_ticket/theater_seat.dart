import 'package:flutter/material.dart';

class TheaterSeat extends StatefulWidget {
  const TheaterSeat({
    this.scale = 1,
    this.isTaken = true,
    Key? key,
  }) : super(key: key);

  final bool isTaken;
  final double scale;

  @override
  State<TheaterSeat> createState() => _TheaterSeatState();
}

class _TheaterSeatState extends State<TheaterSeat> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var chairColor = widget.isTaken ? Color(0xff2C2B37) : Color(0xffB3B3C3);
    if (isSelected) {
      chairColor = Color(0xffF51933);
    }
    return Transform.scale(
      scale: widget.scale,
      child: Container(
        margin: EdgeInsets.only(top: 4),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Icon(
            Icons.chair,
            color: chairColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
