
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/domain/use_case/search_movie_use_case.dart';


import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchMovieUseCase) : super(SearchInitial());
  final SearchMovieUseCase searchMovieUseCase;
  searh(String q) async {
    final res =
        await searchMovieUseCase.call(q);
    res.fold(
      (failure) => emit(SearchMovieFailure(failure.errorMessage)),
      (movie) => emit(SearchdMovieSuccess(movie)),
    );
  }
}
