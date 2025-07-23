import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  static final movieUrl = dotenv.env['MOVIE_URL'].toString();
  static final movieImageUrl = dotenv.env['MOVIE_IMAGE_URL'].toString();
  static final listPopularMovie = '/movie/popular';
  static final detailMovie = '/movie';

  static final supabaseUrl = dotenv.env['SUPABASE_URL'].toString();
  static final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'].toString();
}