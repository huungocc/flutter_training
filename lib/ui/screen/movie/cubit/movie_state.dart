import 'package:equatable/equatable.dart';
import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieModel> movies;
  final bool isLoadingMore;
  final bool isComplete;

  const MovieLoaded(
      this.movies, {
        this.isLoadingMore = false,
        this.isComplete = false,
      });

  MovieLoaded copyWith({
    List<MovieModel>? movies,
    bool? isLoadingMore,
    bool? isComplete,
  }) {
    return MovieLoaded(
      movies ?? this.movies,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  List<Object> get props => [movies, isLoadingMore, isComplete];
}

class SingleMovieLoaded extends MovieState {
  final MovieModel movie;

  const SingleMovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieStreaming extends MovieState {
  final List<MovieModel> movies;
  final bool isComplete;
  final int currentPage;
  final int totalPages;
  final bool isLoadingMore;

  const MovieStreaming(
      this.movies, {
        this.isComplete = false,
        this.currentPage = 1,
        this.totalPages = 1,
        this.isLoadingMore = false,
      });

  @override
  List<Object> get props => [movies, isComplete, currentPage, totalPages, isLoadingMore];

  MovieStreaming copyWith({
    List<MovieModel>? movies,
    bool? isComplete,
    int? currentPage,
    int? totalPages,
    bool? isLoadingMore,
  }) {
    return MovieStreaming(
      movies ?? this.movies,
      isComplete: isComplete ?? this.isComplete,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class MovieError extends MovieState {
  // final String message;
  //
  // const MovieError(this.message);
  //
  // @override
  // List<Object> get props => [message];
}