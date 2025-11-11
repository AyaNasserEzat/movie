import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_grid_view.dart';
import 'package:movies/core/features/home/presentation/views/widgets/recommendation_section.dart';

import 'recommendation_test.mocks.dart';

@GenerateMocks([SimilarMovieCubit])
void main() {
  late MockSimilarMovieCubit mockSimilarMovieCubit;
  setUp((){
    mockSimilarMovieCubit=MockSimilarMovieCubit();
    when(mockSimilarMovieCubit.stream).thenAnswer((_)=>Stream.empty());
  });
  int id=1;
  mackwidget(){
  return  MaterialApp(
    home: BlocProvider<SimilarMovieCubit>(
      create: (context) => mockSimilarMovieCubit,
      child: RecommendationSection(id: id,))
  );
  }
  group("test recommendation widget", (){
  testWidgets("should return CircularProgressIndicator when state is loading", (tester)async{
when(mockSimilarMovieCubit.state).thenReturn(SimilarMoviesInitialLoading());
await tester.pumpWidget(mackwidget());
expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
    final tMovie=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 5)];

    testWidgets("should return CustomGridView when state is success", (tester)async{
when(mockSimilarMovieCubit.state).thenReturn(SimilarMoviesInitialSuccess(tMovie));
await tester.pumpWidget(mackwidget());
expect(find.byType(CustomGridView), findsOneWidget);
  });
      testWidgets("should return text error when state is failed", (tester)async{
when(mockSimilarMovieCubit.state).thenReturn(SimilarMoviesInitialFailure("server error"));
await tester.pumpWidget(mackwidget());
expect(find.text("server error"), findsOneWidget);
  });
  });

}