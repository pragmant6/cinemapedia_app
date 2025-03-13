import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getNowPopular({int page = 1});
  Future<List<Movie>> getUpComing({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById(String movieID);
  Future<List<Movie>> searchMovies(String movie);
}
