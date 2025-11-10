import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_company.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_country.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/spoken_language.dart';
import 'package:movies/core/features/home/domain/use_case/movie_details_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_state.dart';

import 'movie_details_cubit_test.mocks.dart';

@GenerateMocks([MovieDetailsUseCase])
void main() {
   late MockMovieDetailsUseCase mockMovieDetailsUseCase;
  late MovieDetailsCubit movieDetailsCubit;

  setUp((){
    mockMovieDetailsUseCase=MockMovieDetailsUseCase();
    movieDetailsCubit=MovieDetailsCubit(mockMovieDetailsUseCase);

  });
  final int movie=1;
final tmovieModelDetails=MovieDetailModel(adult: true, backdropPath: "backdropPath", budget: 3, genres: [Genre(id: 1, name: "name")], id: movie,  originCountry: ["originCountry"], originalLanguage: "originalLanguage", originalTitle: "originalTitle", overview: "overview", popularity: 2, posterPath: "posterPath", productionCompanies: [ProductionCompany(id: 2, name: "name", originCountry: "originCountry", logoPath: '')], productionCountries: [ProductionCountry(iso31661: "iso31661", name: "name")], releaseDate: "releaseDate", revenue: 3, runtime: 1, spokenLanguages: [SpokenLanguage(englishName: "englishName", iso6391: "iso6391", name: "name")], status: "status", tagline: "tagline", title: "title", video: false, voteAverage: 4, voteCount: 3, belongsToCollection: null, homepage: '', imdbId: '');
  group("test moviediatls cubit", (){
blocTest("emits [MovieDetailsLoading, MovieDetailsLoadingSuccess] when data fetch success  ", 
build: (){
  when(mockMovieDetailsUseCase.call(movie)).thenAnswer((_) async=>Right(tmovieModelDetails));
return movieDetailsCubit;
},
act: (cubit) => cubit.getMovieDetails(movie),
expect: () => [
 MovieDetailsLoading(),
  MovieDetailsLoadingSuccess(tmovieModelDetails),
 
],
);
     const tErrorMessage = 'Server Error';
      
blocTest("emits [MovieDetailsLoading, SimilarMoviesSuccess] when data fetch success  ", 
build: (){
  when(mockMovieDetailsUseCase.call(movie)).thenAnswer((_) async=>Left(Failure(errorMessage: tErrorMessage)));
return movieDetailsCubit;
},
act: (cubit) => cubit.getMovieDetails(movie),
expect: () => [
 MovieDetailsLoading(),
  MovieDetailsFailure(tErrorMessage),
 
],
);

  });
}