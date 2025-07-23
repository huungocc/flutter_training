import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';

class MovieResponse {
  final List<MovieModel> movies;
  final int page;
  final int totalPages;

  MovieResponse({
    required this.movies,
    required this.page,
    required this.totalPages,
  });
}