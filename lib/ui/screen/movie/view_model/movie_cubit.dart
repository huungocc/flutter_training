import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/ui/screen/movie/view_model/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/view_model/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieService movieService;

  MovieCubit(this.movieService) : super(MovieInitial());

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
