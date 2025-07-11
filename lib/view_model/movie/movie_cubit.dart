import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/view_model/movie/movie_state.dart';

import '../../service/movie_service.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieService movieService;

  MovieCubit(this.movieService) : super(MovieInitial());

  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());
    try {
      final movies = await movieService.getListPopularMovie();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError('$e'));
    }
  }
}
