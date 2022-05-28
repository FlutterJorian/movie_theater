import 'package:flutter/material.dart';

class StarRatingAnimated extends StatelessWidget {
  const StarRatingAnimated({
    required this.starAnimationValues,
    required this.rating,
    Key? key,
  }) : super(key: key);

  final double rating;
  final List<double> starAnimationValues;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(0, starAnimationValues[0]),
          child: Text(
            rating.toString(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        SizedBox(width: 10),
        Transform.translate(
          offset: Offset(0, starAnimationValues[0]),
          child: Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
            size: 15,
          ),
        ),
        Transform.translate(
          offset: Offset(0, starAnimationValues[1]),
          child: Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
            size: 15,
          ),
        ),
        Transform.translate(
          offset: Offset(0, starAnimationValues[2]),
          child: Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
            size: 15,
          ),
        ),
        Transform.translate(
          offset: Offset(0, starAnimationValues[3]),
          child: Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
            size: 15,
          ),
        ),
        Transform.translate(
          offset: Offset(0, starAnimationValues[4]),
          child: Icon(
            Icons.star_border,
            color: Colors.grey.shade400,
            size: 15,
          ),
        ),
      ],
    );
  }
}
