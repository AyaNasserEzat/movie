import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/database/api/dio_concumer.dart';

import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';

import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_playing_move_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  NowPlayingMovieCubit() : super(NowPlayingMovieInitial());
  getNowPlayingMovie() async {
    final res =
        await NowPlayingUseCase(
          movieRepo: MovieRepoImp(
            movieRemoteDataSource: MovieRemoteDataSourceImp(
              api: DioConcumer(dio: Dio()),
            ),
          ),
        ).call();
    res.fold(
      (failure) => emit(NowPlayingMovieFailure(failure.errorMessage)),
      (movie) => emit(NowPlayingMovieSuccess(movie)),
    );
  }
}
