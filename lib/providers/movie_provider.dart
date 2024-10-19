import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_api/tmdb_api.dart';

final movieProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final String apiKey =  '67af5e631dcbb4d0981b06996fcd47bc';
  final String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';

  TMDB tmdbWithCustomLogs = TMDB(
    ApiKeys(apiKey, readAccessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
  );

  Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

  return {
    'trending': trendingResult['results'],
    'topRated': topRatedResult['results'],
    'tv': tvResult['results'],
  };
});