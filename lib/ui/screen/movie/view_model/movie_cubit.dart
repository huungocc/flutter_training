import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';
import 'package:flutter_training/ui/screen/movie/view_model/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/view_model/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieService movieService;
  StreamSubscription? _streamSubscription;

  MovieCubit(this.movieService) : super(MovieInitial());

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> fetchPopularMoviesStream() async {
    emit(MovieLoading());

    try {
      final List<MovieModel> movies = [];

      _streamSubscription = movieService.getListPopularMovieStream().listen(
            (movie) {
          movies.add(movie);
          emit(MovieStreaming(List.from(movies), isComplete: false));
        },
        onError: (error) {
          if (error is DioException) {
            emit(MovieError());
          } else {
            final errorMessage = ExceptionHandler.handleSyntaxError(error);
            ExceptionHandler.showErrorSnackBar(errorMessage);
            emit(MovieError());
          }
        },
        onDone: () {
          emit(MovieStreaming(movies, isComplete: true));
        },
      );
    } catch (e) {
      if (e is DioException) {
        emit(MovieError());
      } else {
        final errorMessage = ExceptionHandler.handleSyntaxError(e);
        ExceptionHandler.showErrorSnackBar(errorMessage);
        emit(MovieError());
      }
    }
  }

  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());
    try {
      final movies = await movieService.getListPopularMovie();
      emit(MovieLoaded(movies));
    } on DioException {
      emit(MovieError());
    } catch (e) {
      final errorMessage = ExceptionHandler.handleSyntaxError(e);
      ExceptionHandler.showErrorSnackBar(errorMessage);
      emit(MovieError());
    }
  }
}
