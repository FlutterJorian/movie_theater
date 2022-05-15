import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    required this.image,
    this.width = 200.0,
    this.isFullscreen = false,
    Key? key,
  }) : super(key: key);

  final String image;
  final double? width;
  final bool isFullscreen;

  @override
  Widget build(BuildContext context) {
    if (isFullscreen) {
      return Image.asset(
        'assets/images/$image',
        fit: BoxFit.cover,
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/images/$image',
          width: width,
        ),
      );
    }
  }
}
