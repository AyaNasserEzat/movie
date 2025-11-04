import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/database/api/dio_concumer.dart';

import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';

import 'package:movies/core/features/home/domain/use_case/top_rated_use_case.dart';

import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  TopRatedMovieCubit() : super(TopRatedMovieInitial());
  getTopRatedMovie() async {
    emit(TopRatedMovieLoading());
    final res =
        await TopRatedUseCase(
          movieRepo: MovieRepoImp(
            movieRemoteDataSource: MovieRemoteDataSourceImp(
              api: DioConcumer(dio: Dio()),
            ),
          ),
        ).call();
    res.fold(
      (failure) => emit(TopRatedMovieFailure(failure.errorMessage)),
      (movie) => emit(TopRatedMovieSuccess(movie)),
    );
  }
}
