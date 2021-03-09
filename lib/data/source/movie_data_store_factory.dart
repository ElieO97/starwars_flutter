import 'package:star_wars_flutter/data/repository/movie_cache.dart';
import 'package:star_wars_flutter/data/repository/movie_data_store.dart';
import 'package:star_wars_flutter/data/source/movie_cache_data_store.dart';
import 'package:star_wars_flutter/data/source/movie_remote_data_store.dart';

class MovieDataStoreFactory {
  MovieDataStoreFactory(
      this._movieCache, this._movieRemoteDataStore, this._movieCacheDataStore);

  final MovieCacheDataStore _movieCacheDataStore;
  final MovieRemoteDataStore _movieRemoteDataStore;
  final MovieCache _movieCache;

  Future<MovieDataStore> retrieveDataStore() async {
    if (await _movieCache.isCached()) {
      return retrieveCachedDataStore();
    }
    return retrieveRemoteDataStore();
  }

  MovieDataStore retrieveCachedDataStore() {
    return _movieCacheDataStore;
  }

  MovieDataStore retrieveRemoteDataStore() {
    return _movieRemoteDataStore;
  }
}
