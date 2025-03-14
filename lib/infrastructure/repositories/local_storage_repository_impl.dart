import 'package:cinemapedia_app/domain/data_sources/local_storage_data_source.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/domain/repositories/loca_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource dataSource;

  LocalStorageRepositoryImpl(this.dataSource);
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return dataSource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return dataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return dataSource.toggleFavorite(movie);
  }
}
