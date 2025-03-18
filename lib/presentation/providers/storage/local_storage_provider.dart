import 'package:cinemapedia_app/infrastructure/data_sources/isar_data_source.dart';
import 'package:cinemapedia_app/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDataSource());
});
