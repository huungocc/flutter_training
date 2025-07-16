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

  const MovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieStreaming extends MovieState {
  final List<MovieModel> movies;
  final bool isComplete;

  const MovieStreaming(this.movies, {this.isComplete = false});

  @override
  List<Object> get props => [movies, isComplete];
}

class MovieError extends MovieState {
  // final String message;
  //
  // const MovieError(this.message);
  //
  // @override
  // List<Object> get props => [message];
}