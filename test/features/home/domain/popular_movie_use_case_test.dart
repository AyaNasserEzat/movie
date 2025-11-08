import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/popular_movie_usecase.dart';

import "now_playing_use_case_test.mocks.dart";
void main() {
  late MovieRepo movieRepo;
  late PopularMovieUsecase popularMovieUsecase;
  setUp((){
    movieRepo=MockMovieRepo();
popularMovieUsecase  =PopularMovieUsecase(movieRepo:movieRepo );
  });

group("test popoular  movie use case", (){
  final movieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2.0, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 3)];
  test("test popular movie use case right", ()async{
    when(movieRepo.getPopularMovie()).thenAnswer((_)async=>Right(movieEntity));
 final res=await popularMovieUsecase.call();
 expect(res, Right(movieEntity));
 verify(movieRepo.getPopularMovie());
 verifyNoMoreInteractions(movieRepo);
  });
final failure=Failure(errorMessage: "errorMessage");
    test("test popular movie use case left", ()async{
    when(movieRepo.getPopularMovie()).thenAnswer((_)async=>Left(failure));
 final res=await popularMovieUsecase.call();
 expect(res, Left(failure));
 verify(movieRepo.getPopularMovie());
 verifyNoMoreInteractions(movieRepo);
  });
});
}