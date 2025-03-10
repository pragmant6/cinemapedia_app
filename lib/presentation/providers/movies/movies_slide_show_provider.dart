import 'package:cinemapedia_app/config/domain/entities/movie.dart';

import './movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  return nowPlayingMovies.isEmpty ? [] : nowPlayingMovies.sublist(0, 6);
});
