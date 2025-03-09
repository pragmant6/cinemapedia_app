import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBKey =
      dotenv.env['THE_MOVIE_DB_KEY'] ?? 'No hay api key';
  static String baseUrlTheMovieDb =
      dotenv.env['THE_MOVIE_DB_URL'] ?? 'No hay api key';
  static String baseUrlTheMovieDbImage =
      dotenv.env['THE_MOVIE_DB_IMAGE_URL'] ?? 'No hay api key';
}
