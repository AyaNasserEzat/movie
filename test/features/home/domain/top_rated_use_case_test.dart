import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/top_rated_use_case.dart';

import "now_playing_use_case_test.mocks.dart";
void main() {
  late MovieRepo movieRepo;
  late TopRatedUseCase topRatedUseCase;
  setUp((){
    movieRepo=MockMovieRepo();
topRatedUseCase  =TopRatedUseCase(movieRepo:movieRepo );
  });

group("test top rated  movie use case", (){
  final movieEntity=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2.0, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 3)];
  test("test top rated movie use case right", ()async{
    when(movieRepo.getTopRatedMovie()).thenAnswer((_)async=>Right(movieEntity));
 final res=await topRatedUseCase.call();
 expect(res, Right(movieEntity));
 verify(movieRepo.getTopRatedMovie());
 verifyNoMoreInteractions(movieRepo);
  });
final failure=Failure(errorMessage: "errorMessage");
    test("test top rarted movie use case left", ()async{
    when(movieRepo.getTopRatedMovie()).thenAnswer((_)async=>Left(failure));
 final res=await topRatedUseCase.call();
 expect(res, Left(failure));
 verify(movieRepo.getTopRatedMovie());
 verifyNoMoreInteractions(movieRepo);
  });
});
}