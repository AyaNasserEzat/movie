import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/database/api/api_consumer.dart';

import 'package:movies/core/database/api/dio_concumer.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';
import 'package:movies/core/features/home/domain/use_case/popular_movie_usecase.dart';
import 'package:movies/core/features/home/domain/use_case/search_movie_use_case.dart';
import 'package:movies/core/features/home/domain/use_case/top_rated_use_case.dart';

final sl=GetIt.instance;
void setupServicesLocator(){
  sl.registerLazySingleton(()=>Dio());
  sl.registerLazySingleton<ApiConsumer>(()=>DioConcumer(dio: sl()));


  // DataSource
  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImp( api:  sl()),
  );
  

  // Repository
  sl.registerLazySingleton<MovieRepo>(
    () => MovieRepoImp(movieRemoteDataSource: sl()),
  );
 

  // UseCase
    sl.registerLazySingleton(() =>SearchMovieUseCase(movieRepo: sl()));
sl.registerLazySingleton(()=>NowPlayingUseCase(movieRepo: sl()));
sl.registerLazySingleton(()=>PopularMovieUsecase(movieRepo: sl()));
sl.registerLazySingleton(()=>TopRatedUseCase(movieRepo: sl()));
  // Cubit
  // sl.registerFactory(() => PopularMovieCubit(sl()));
  // sl.registerFactory(() => TopRatedMoviesCubit(sl()));
  // sl.registerFactory(() => NowPlayingMovieCubit(sl()));
  // sl.registerFactory(() => MovieDetailsCubit(sl()));
  // sl.registerFactory(() => RecommendationMoviesCubit(sl()));
  // sl.registerFactory(() => SearchCubit(sl()));
}
