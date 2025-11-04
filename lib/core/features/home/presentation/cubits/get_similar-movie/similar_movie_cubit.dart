import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/database/api/dio_concumer.dart';

import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';
import 'package:movies/core/features/home/domain/use_case/get_similar_movies.dart';

import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_state.dart';



class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(SimilarMoviesInitial());
  getSimilarMovies(int id) async {
    final res =
        await GetSimilarMoviesUseCase(
          movieRepo: MovieRepoImp(
            movieRemoteDataSource: MovieRemoteDataSourceImp(
              api: DioConcumer(dio: Dio()),
            ),
          ),
        ).call(id);
    res.fold(
      (failure) => emit(SimilarMoviesInitialFailure(failure.errorMessage)),
      (movie) => emit(SimilarMoviesInitialSuccess(movie)),
    );
  }
}
