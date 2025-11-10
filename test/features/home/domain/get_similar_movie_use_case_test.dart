import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';
import 'package:movies/core/features/home/domain/repo/movie_repo.dart';
import 'package:movies/core/features/home/domain/use_case/get_similar_movies.dart';



import "now_playing_use_case_test.mocks.dart";
void main() {
  late MovieRepo movieRepo;
  late GetSimilarMoviesUseCase getSimilarMovieUseCase;
  setUp((){
    movieRepo=MockMovieRepo();
getSimilarMovieUseCase  =GetSimilarMoviesUseCase(movieRepo:movieRepo );
  });
final int movie=1;

  final movieModel = [
    MovieModel(
      id: 1,
      adult: false,
      backdropPath: "backdropPath",
      genreIds: [1, 2],
      originalLanguage: "en",
      originalTitle: "title",
      overview: "overview",
      popularity: 2.0,
      posterPath: "posterPath",
      releaseDate: "releaseDate",
      title: "title",
      video: false,
      voteAverage: 3.0,
      voteCount: 10,
    ),
  ];
  test("test get similar movie  use case right", ()async{
    when(movieRepo.getSimilarMovies(movie)).thenAnswer((_)async=>Right(movieModel));
 final res=await getSimilarMovieUseCase.call(movie);
 expect(res, Right(movieModel));
 verify(movieRepo.getSimilarMovies(movie));
 verifyNoMoreInteractions(movieRepo);
  });
final failure=Failure(errorMessage: "errorMessage");
    test("test get similar movies use case left", ()async{
    when(movieRepo.getSimilarMovies(movie)).thenAnswer((_)async=>Left(failure));
 final res=await getSimilarMovieUseCase.call(movie);
 expect(res, Left(failure));
 verify(movieRepo.getSimilarMovies(movie));
 verifyNoMoreInteractions(movieRepo);
  });
}