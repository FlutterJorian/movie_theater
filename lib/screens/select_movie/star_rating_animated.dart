import 'package:flutter/material.dart';

class StarRatingAnimated extends StatelessWidget {
  const StarRatingAnimated({
    required this.starAnimations,
    required this.rating,
    Key? key,
  }) : super(key: key);

  final double rating;
  final List<Animation<double>> starAnimations;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: starAnimations[0],
          builder: (context, _) => Row(
            children: [
              Transform.translate(
                offset: Offset(0, starAnimations[0].value),
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
                offset: Offset(0, starAnimations[0].value),
                child: Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: starAnimations[1],
          builder: (context, _) => Transform.translate(
            offset: Offset(0, starAnimations[1].value),
            child: Icon(
              Icons.star,
              color: Colors.deepOrangeAccent,
              size: 15,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: starAnimations[2],
          builder: (context, _) => Transform.translate(
            offset: Offset(0, starAnimations[2].value),
            child: Icon(
              Icons.star,
              color: Colors.deepOrangeAccent,
              size: 15,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: starAnimations[3],
          builder: (context, _) => Transform.translate(
            offset: Offset(0, starAnimations[3].value),
            child: Icon(
              Icons.star,
              color: Colors.deepOrangeAccent,
              size: 15,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: starAnimations[4],
          builder: (context, _) => Transform.translate(
            offset: Offset(0, starAnimations[4].value),
            child: Icon(
              Icons.star_border,
              color: Colors.grey.shade400,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
