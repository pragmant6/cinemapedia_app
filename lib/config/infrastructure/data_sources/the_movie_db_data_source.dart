import 'package:cinemapedia_app/config/domain/data_sources/movies_data_source.dart';
import 'package:cinemapedia_app/config/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/config/infrastructure/models/movie_db/movie_db_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';

class TheMovieDbDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrlTheMovieDb,
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX',
      },
    ),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // TODO: implement getNowPlaying
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        movieDBResponse.results
            .where((movie) => movie.posterPath != 'no-poster')
            .map((movie) => MovieMapper.movieDBToEntity(movie))
            .toList();
    return movies;
  }
}
