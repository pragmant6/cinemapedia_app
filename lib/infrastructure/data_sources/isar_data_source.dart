import 'package:cinemapedia_app/domain/data_sources/local_storage_data_source.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDataSource extends LocalStorageDataSource {
  late Future<Isar> db;

  IsarDataSource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavorite =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return isFavorite != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    final List<Movie> movies =
        await isar.movies.where().offset(offset).limit(limit).findAll();
    return movies;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoritesMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoritesMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoritesMovie.isarId!));
    }

    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
