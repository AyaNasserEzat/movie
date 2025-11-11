import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/get_similar-movie/similar_movie_state.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_grid_view.dart';
import 'package:movies/core/features/home/presentation/views/widgets/recommendation_section.dart';
import 'package:movies/core/features/home/presentation/views/widgets/search_view_body.dart';

import 'search_body_test.mocks.dart';
@GenerateMocks([SearchCubit])
void main() {
  late MockSearchCubit mockSearchCubit;
  setUp((){
    mockSearchCubit=MockSearchCubit();
    when(mockSearchCubit.stream).thenAnswer((_)=>Stream.empty());
  });
  int id=1;
  mackwidget(){
  return  MaterialApp(
    home: BlocProvider<SearchCubit>(
      create: (context) => mockSearchCubit,
      child: Scaffold(body: SearchViewBody()))
  );
  }
  group("test search body widget", (){
  testWidgets("should return CircularProgressIndicator when state is loading", (tester)async{
when(mockSearchCubit.state).thenReturn(SearchLoading());
await tester.pumpWidget(mackwidget());
expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
    final tMovie=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 5)];

    testWidgets("should return CustomGridView when state is success", (tester)async{
when(mockSearchCubit.state).thenReturn(SearchdMovieSuccess(tMovie));
await tester.pumpWidget(mackwidget());
expect(find.byType(CustomGridView), findsOneWidget);
  });
      testWidgets("should return text error when state is failed", (tester)async{
when(mockSearchCubit.state).thenReturn(SearchMovieFailure("server error"));
await tester.pumpWidget(mackwidget());
expect(find.text("server error"), findsOneWidget);
  });
  });
}