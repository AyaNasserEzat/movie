
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';

import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_playing_move_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  NowPlayingMovieCubit(this.nowPlayingUseCase) : super(NowPlayingMovieInitial());
  final NowPlayingUseCase nowPlayingUseCase;
  getNowPlayingMovie() async {
    emit(NowPlayingMovieLoading());
    final res =
        await nowPlayingUseCase.call();
    res.fold(
      (failure) => emit(NowPlayingMovieFailure(failure.errorMessage)),
      (movie) => emit(NowPlayingMovieSuccess(movie)),
    );
  }
}
