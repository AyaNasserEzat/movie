
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/use_case/top_rated_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';

import 'top_rated_cubit_test.mocks.dart';


@GenerateMocks([TopRatedUseCase])


void main() {
  late MockTopRatedUseCase mockTopRatedtMovieUseCase;
  late TopRatedMovieCubit popularMovieCubit;
  setUp((){
mockTopRatedtMovieUseCase=MockTopRatedUseCase();
// Inject the mock into the Cubit
popularMovieCubit=TopRatedMovieCubit(mockTopRatedtMovieUseCase);
  });
tearDown(() {
    // إغلاق الـ Cubit
    popularMovieCubit.close(); 
  });group("top rated movie cubit", (){
    final tmovieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 2)];

  blocTest<TopRatedMovieCubit, TopRatedMovieState>("emits [TopRatedMovieLoading, TopRatedMovieSuccess] when data fetch fails",
   build: (){
when(mockTopRatedtMovieUseCase.call()).thenAnswer((_) async=>Right(tmovieEntity) );
return popularMovieCubit;
  },
  //act
  act: (cubit) => cubit.getTopRatedMovie() ,
  //assert
  expect: ()=>[
    isA<TopRatedMovieLoading>(),
    isA<TopRatedMovieSuccess>().having((state)=>state.movies, "list movie",
     equals(tmovieEntity))
  ],
  verify: (_) {
      // Verify that the UseCase was called exactly once
      verify(mockTopRatedtMovieUseCase.call()).called(1);
    },
  );

  // Test case for a failure during data retrieval
  blocTest<TopRatedMovieCubit, TopRatedMovieState>(
    'emits [TopRatedMovieLoading, TopRatedMovieFailure] when data fetch fails',
    build: () {
      const tErrorMessage = 'Server Error';
      
      // Stub the mock to return a failure result (Left)
      when(mockTopRatedtMovieUseCase.call())
          .thenAnswer((_) async => Left(Failure( errorMessage: tErrorMessage)));
      return popularMovieCubit;
    },
    act: (cubit) => cubit.getTopRatedMovie(),
    // Expect the state sequence: Initial -> Loading -> Failure
    expect: () => [
      isA<TopRatedMovieLoading>(),
      isA<TopRatedMovieFailure>().having(
        (state) => state.message,
        'errorMessage',
        equals('Server Error'),
      ),
    ],
    verify: (_) {
      // Verify that the UseCase was called exactly once
      verify(mockTopRatedtMovieUseCase.call()).called(1);
    },
  );
  });
}


