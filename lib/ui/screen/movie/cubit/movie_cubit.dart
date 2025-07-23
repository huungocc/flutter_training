import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';
import 'package:flutter_training/ui/screen/movie/service/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieService movieService;
  StreamSubscription? _streamSubscription;

  MovieCubit(this.movieService) : super(MovieInitial());

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> fetchPopularMoviesStream({bool refresh = false}) async {
    _streamSubscription?.cancel();

    if (refresh) {
      emit(MovieLoading());
    }

    try {
      final response = await movieService.getListPopularMovie(page: 1);
      final List<int?> ids = response.movies.map((e) => e.id).toList();

      final List<MovieModel> detailedMovies = [];
      final currentPage = response.page;
      final totalPages = response.totalPages;

      _streamSubscription = movieService.getMovieDetailStream(ids).listen(
            (movie) {
          detailedMovies.add(movie);
          emit(MovieStreaming(
            List.from(detailedMovies),
            isComplete: false,
            currentPage: currentPage,
            totalPages: totalPages,
          ));
        },
        onDone: () {
          emit(MovieStreaming(
            List.from(detailedMovies),
            isComplete: currentPage >= totalPages,
            currentPage: currentPage,
            totalPages: totalPages,
          ));
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

  Future<void> loadMoreMovies() async {
    final currentState = state;

    if (currentState is! MovieStreaming) return;
    if (currentState.isComplete || currentState.isLoadingMore) return;
    if (currentState.currentPage >= currentState.totalPages) return;

    final nextPage = currentState.currentPage + 1;
    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final response = await movieService.getListPopularMovie(page: nextPage);
      final ids = response.movies.map((e) => e.id).toList();

      final updatedMovies = List<MovieModel>.from(currentState.movies);

      _streamSubscription = movieService.getMovieDetailStream(ids).listen(
            (movie) {
          updatedMovies.add(movie);
          emit(currentState.copyWith(
            movies: List.from(updatedMovies),
            isLoadingMore: true,
          ));
        },
        onDone: () {
          emit(currentState.copyWith(
            movies: List.from(updatedMovies),
            isLoadingMore: false,
            isComplete: nextPage >= response.totalPages,
            currentPage: nextPage,
            totalPages: response.totalPages,
          ));
        },
      );
    } catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
      ExceptionHandler.showErrorSnackBar(ExceptionHandler.handleSyntaxError(e));
      emit(MovieError());
    }
  }
}
