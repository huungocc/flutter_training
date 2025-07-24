import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';
import 'package:flutter_training/ui/screen/movie/service/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/cubit/movie_state.dart';

class SimpleMovieCubit extends Cubit<MovieState> {
  final MovieService movieService;
  int _currentPage = 1;
  int _totalPages = 1;
  List<MovieModel> _movies = [];

  SimpleMovieCubit(this.movieService) : super(MovieInitial());

  Future<void> fetchPopularMovies({bool refresh = false}) async {
    if (refresh) {
      emit(MovieLoading());
      _movies = [];
      _currentPage = 1;
    }

    try {
      final response = await movieService.getListSimplePopularMovie(page: 1);
      _movies = response.movies;
      _currentPage = response.page;
      _totalPages = response.totalPages;

      final isComplete = _currentPage >= _totalPages;

      emit(MovieLoaded(
        List.from(_movies),
        isComplete: isComplete,
      ));
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
    if (currentState is! MovieLoaded) return;
    if (_currentPage >= _totalPages || currentState.isLoadingMore) return;

    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final nextPage = _currentPage + 1;
      final response = await movieService.getListSimplePopularMovie(page: nextPage);
      _movies.addAll(response.movies);
      _currentPage = response.page;
      _totalPages = response.totalPages;

      final isComplete = _currentPage >= _totalPages;

      emit(MovieLoaded(
        List.from(_movies),
        isComplete: isComplete,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
      if (e is DioException) {
        emit(MovieError());
      } else {
        final errorMessage = ExceptionHandler.handleSyntaxError(e);
        ExceptionHandler.showErrorSnackBar(errorMessage);
        emit(MovieError());
      }
    }
  }

  Future<void> loadSingleMovie(int id) async {
    emit(MovieLoading());
     try {
       final response = await movieService.getMovieDetail(id);
       emit(SingleMovieLoaded(response));
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
}
