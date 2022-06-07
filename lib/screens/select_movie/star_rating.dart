import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({required this.rating, Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 10),
        ...List.generate(
          4,
          (index) => const Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
            size: 15,
          ),
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey.shade400,
          size: 15,
        ),
      ],
    );
  }
}
