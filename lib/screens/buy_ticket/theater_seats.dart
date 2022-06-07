import 'package:flutter/material.dart';
import 'package:movie_theater/screens/buy_ticket/theater_seat.dart';

class TheaterSeats extends StatelessWidget {
  const TheaterSeats({
    required this.seatRowAnimations,
    this.onSelected,
    Key? key,
  }) : super(key: key);

  final List<Animation<double>> seatRowAnimations;
  final void Function(bool selected)? onSelected;

  @override
  Widget build(BuildContext context) {
    const seatMargin = 4.0;
    const seatSize = 23.0;
    const totalseatSize = seatSize + seatMargin;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: totalseatSize),
            TheaterSeat(
                scaleAnimation: seatRowAnimations[1], onSelected: onSelected),
            TheaterSeat(
                scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
            TheaterSeat(
                scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
            TheaterSeat(
                scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
            TheaterSeat(
                scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, left: seatMargin),
          child: Column(
            children: [
              const SizedBox(height: totalseatSize),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[1], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[7], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[7], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[7], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[7],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[7],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[7],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[7],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, left: seatMargin),
          child: Column(
            children: [
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[0],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[1],
                  onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[7],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[8],
                  onSelected: onSelected),
              TheaterSeat(
                  isTaken: false,
                  scaleAnimation: seatRowAnimations[9],
                  onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3, left: totalseatSize),
          child: Column(
            children: [
              const SizedBox(height: totalseatSize),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[1], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[7], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[8], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[9], onSelected: onSelected),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: seatMargin),
          child: Column(
            children: [
              const SizedBox(height: totalseatSize),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[1], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[2], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[3], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[4], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[5], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[6], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[7], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[8], onSelected: onSelected),
              TheaterSeat(
                  scaleAnimation: seatRowAnimations[9], onSelected: onSelected),
            ],
          ),
        ),
      ],
    );
  }
}
