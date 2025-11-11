

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_company.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_country.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/spoken_language.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/movie_details_cubit/movie_details_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/movie_details_body.dart';
import 'package:movies/core/features/home/presentation/views/widgets/movie_image.dart';

import 'movie_details_body_test.mocks.dart';

@GenerateMocks([MovieDetailsCubit])

void main() {
  late MockMovieDetailsCubit mockMovieDetailsCubit;
  setUp((){
mockMovieDetailsCubit=MockMovieDetailsCubit();
//when(mockMovieDetailsCubit.stream).thenAnswer((_)=>Stream.empty());

  });

  mackwidget(){
  return  MaterialApp(
    home: BlocProvider<MovieDetailsCubit>(
      create: (context) => mockMovieDetailsCubit,
      child: MovieDetailsBody())
  );
  }
  group("test movie details body", (){
testWidgets("should return CircularProgressIndicator when state loading", (tester)async{
   when(mockMovieDetailsCubit.state).thenReturn(MovieDetailsLoading());
  when(mockMovieDetailsCubit.stream)
    .thenAnswer((_) => Stream.value(MovieDetailsLoading()));

await tester.pumpWidget(mackwidget());
expect(find.byType(Image), findsNothing);
 expect(find.byType(CircularProgressIndicator),findsOneWidget );
});
testWidgets("should return imge , text of movie when state success", (tester)async{
final int movie=1;
final tmovieModelDetails=MovieDetailModel(adult: true, backdropPath: "backdropPath", budget: 3, genres: [Genre(id: 1, name: "name")], id: movie,  originCountry: ["originCountry"], originalLanguage: "originalLanguage", originalTitle: "originalTitle", overview: "overview", popularity: 2, posterPath: "posterPath", productionCompanies: [ProductionCompany(id: 2, name: "name", originCountry: "originCountry", logoPath: '')], productionCountries: [ProductionCountry(iso31661: "iso31661", name: "name")], releaseDate: "releaseDate", revenue: 3, runtime: 1, spokenLanguages: [SpokenLanguage(englishName: "englishName", iso6391: "iso6391", name: "name")], status: "status", tagline: "tagline", title: "title", video: false, voteAverage: 4, voteCount: 3, belongsToCollection: null, homepage: '', imdbId: '');
  when(mockMovieDetailsCubit.state).thenReturn(MovieDetailsLoadingSuccess(tmovieModelDetails));
  when(mockMovieDetailsCubit.stream)
    .thenAnswer((_) => Stream.value(MovieDetailsLoadingSuccess(tmovieModelDetails)));

await tester.pumpWidget(mackwidget());
expect(find.byType(MovieImage), findsOneWidget);
Finder title=find.text("title");
expect(title, findsOneWidget);

});
      testWidgets("should return text error when state is failed", (tester)async{
when(mockMovieDetailsCubit.state).thenReturn(MovieDetailsFailure("server error"));
  when(mockMovieDetailsCubit.stream)
    .thenAnswer((_) => Stream.value(MovieDetailsFailure("server error")));

await tester.pumpWidget(mackwidget());
expect(find.text("server error"), findsOneWidget);
  });
testWidgets("shows default error text when state is unknown", (tester) async {
  when(mockMovieDetailsCubit.state).thenReturn(MovieDetailsInitial()); // لو عندك الحالة دي
  when(mockMovieDetailsCubit.stream)
    .thenAnswer((_) => Stream.value(MovieDetailsInitial()));

  await tester.pumpWidget(mackwidget());

  expect(find.text("error"), findsOneWidget);
});
  });
}