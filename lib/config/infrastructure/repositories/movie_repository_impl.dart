import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/config/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesDataSource {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    // TODO: implement getNowPlaying
    return this.dataSource.getNowPlaying(page: page);
  }
}
