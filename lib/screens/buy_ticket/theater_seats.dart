import 'package:flutter/material.dart';
import 'package:movie_theater/screens/buy_ticket/theater_seat.dart';

class TheaterSeats extends StatelessWidget {
  const TheaterSeats({
    required this.rowScales,
    Key? key,
  }) : super(key: key);

  final List<double> rowScales;

  @override
  Widget build(BuildContext context) {
    const seatMargin = 4.0;
    const seatSize = 24.0;
    const totalseatSize = seatSize + seatMargin;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: totalseatSize),
            TheaterSeat(scale: rowScales[1]),
            TheaterSeat(scale: rowScales[2]),
            TheaterSeat(scale: rowScales[3]),
            TheaterSeat(scale: rowScales[4]),
            TheaterSeat(scale: rowScales[5]),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 4, left: seatMargin),
          child: Column(
            children: [
              SizedBox(height: totalseatSize),
              TheaterSeat(scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(isTaken: false, scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(isTaken: false, scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(isTaken: false, scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(isTaken: false, scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(isTaken: false, scale: rowScales[0]),
              TheaterSeat(isTaken: false, scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(isTaken: false, scale: rowScales[7]),
              TheaterSeat(isTaken: false, scale: rowScales[8]),
              TheaterSeat(isTaken: false, scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 3, left: totalseatSize),
          child: Column(
            children: [
              SizedBox(height: totalseatSize),
              TheaterSeat(scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(scale: rowScales[7]),
              TheaterSeat(scale: rowScales[8]),
              TheaterSeat(scale: rowScales[9]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: seatMargin),
          child: Column(
            children: [
              SizedBox(height: totalseatSize),
              TheaterSeat(scale: rowScales[1]),
              TheaterSeat(scale: rowScales[2]),
              TheaterSeat(scale: rowScales[3]),
              TheaterSeat(scale: rowScales[4]),
              TheaterSeat(scale: rowScales[5]),
              TheaterSeat(scale: rowScales[6]),
              TheaterSeat(scale: rowScales[7]),
              TheaterSeat(scale: rowScales[8]),
              TheaterSeat(scale: rowScales[9]),
            ],
          ),
        ),
      ],
    );
  }
}
