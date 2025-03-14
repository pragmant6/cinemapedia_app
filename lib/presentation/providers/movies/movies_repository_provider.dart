import 'package:cinemapedia_app/infrastructure/data_sources/the_movie_db_data_source.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDbDataSource());
});
