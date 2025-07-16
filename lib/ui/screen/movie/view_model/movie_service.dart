import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_training/network/api_constant.dart';
import 'package:flutter_training/network/network_impl.dart';
import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';
import 'package:flutter_training/util/localization_service.dart';

class MovieService {
  final NetworkImpl network = NetworkImpl();

  Stream<MovieModel> getListPopularMovieStream() async* {
    final response = await network.get(
      ApiConstant.listPopularMovie,
      query: {
        'api_key': dotenv.env['MOVIE_API_KEY'].toString(),
      },
    );

    if (response is! Map<String, dynamic> || response['results'] is! List) {
      throw Exception(LocalizationService.current.syntax_error_type);
    }

    final List movieList = response['results'] as List;
    final List<int> movieIds = movieList
        .map((movie) => movie['id'] as int)
        .toList();

    for (final id in movieIds) {
      try {
        final movieDetail = await getMovieDetail(id);
        yield movieDetail;
      } catch (e) {
        print('Lỗi load phim $id: $e');
        continue;
      }
    }
  }

  Future<List<MovieModel>> getListPopularMovie() async {
    final response = await network.get(
      ApiConstant.listPopularMovie,
      query: {
        'api_key': dotenv.env['MOVIE_API_KEY'].toString(),
      },
    );

    if (response is! Map<String, dynamic> || response['results'] is! List) {
      throw Exception(LocalizationService.current.syntax_error_type);
    }

    final List movieList = response['results'] as List;
    final List<int> movieIds = movieList
        .map((movie) => movie['id'] as int)
        .toList();

    final List<Future<MovieModel>> detailFutures = movieIds
        .map((id) => getMovieDetail(id))
        .toList();

    final List<MovieModel> detailedMovies = await Future.wait(detailFutures);
    return detailedMovies;
  }

  Future<MovieModel> getMovieDetail(int id) async {
    final response = await network.get(
      '${ApiConstant.detailMovie}/$id',
      query: {
        'api_key': dotenv.env['MOVIE_API_KEY'].toString(),
      },
    );

    if (response is Map<String, dynamic>) {
      return MovieModel.fromJson(response);
    } else {
      throw Exception(LocalizationService.current.syntax_error_type);
    }
  }
}