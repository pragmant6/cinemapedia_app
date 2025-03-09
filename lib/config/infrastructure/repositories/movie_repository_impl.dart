import 'package:cinemapedia_app/config/domain/data_sources/movies_data_source.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/config/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    // TODO: implement getNowPlaying
    return dataSource.getNowPlaying(page: page);
  }
}
