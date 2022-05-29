class Movie {
  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.genres,
    String? backgroundImage,
  }) : _backgroundImage = backgroundImage;
  String title;
  String image;
  final String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? image;
  double rating;
  List<String> genres;
}
