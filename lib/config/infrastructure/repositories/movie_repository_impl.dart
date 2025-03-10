import 'package:cinemapedia_app/config/domain/data_sources/movies_data_source.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/config/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getNowPopular({int page = 1}) {
    return dataSource.getNowPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return dataSource.getUpComing(page: page);
  }
}
