
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/use_case/search_movie_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_state.dart';

import 'search_cubit_test.mocks.dart';


@GenerateMocks([SearchMovieUseCase])
void main() {
  late MockSearchMovieUseCase mockSearchMovieUseCase;
  late SearchCubit searchCubit;

  setUp((){
    mockSearchMovieUseCase=MockSearchMovieUseCase();
    searchCubit=SearchCubit(mockSearchMovieUseCase);

  });
  final String movie="alaa";
      final tmovieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 2)];

  group("test search cubit", (){
blocTest("emits [SearchLoading, PopularMovieSuccess] when data fetch success  ", 
build: (){
  when(mockSearchMovieUseCase.call(movie)).thenAnswer((_) async=>Right(tmovieEntity));
return searchCubit;
},
act: (cubit) => cubit.searh(movie),
expect: () => [
 SearchLoading(),
  SearchdMovieSuccess(tmovieEntity),
 
],
);
     const tErrorMessage = 'Server Error';
      
blocTest("emits [SearchLoading, SearchdMoviefauler] when data fetch success  ", 
build: (){
  when(mockSearchMovieUseCase.call(movie)).thenAnswer((_) async=>Left(Failure(errorMessage: tErrorMessage)));
return searchCubit;
},
act: (cubit) => cubit.searh(movie),
expect: () => [
 SearchLoading(),
  SearchMovieFailure(tErrorMessage),
 
],
);

  });
}