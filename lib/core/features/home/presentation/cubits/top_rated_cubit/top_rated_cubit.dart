
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/domain/use_case/top_rated_use_case.dart';

import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  TopRatedMovieCubit(this.topRatedUseCase) : super(TopRatedMovieInitial());
  final TopRatedUseCase topRatedUseCase;
  getTopRatedMovie() async {
    emit(TopRatedMovieLoading());
    final res =
        await 
        topRatedUseCase.call();
    res.fold(
      (failure) => emit(TopRatedMovieFailure(failure.errorMessage)),
      (movie) => emit(TopRatedMovieSuccess(movie)),
    );
  }
}
