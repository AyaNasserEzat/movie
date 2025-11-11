import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_img_skeletonizer.dart';
import 'package:movies/core/features/home/presentation/views/widgets/top_rated_list.dart';

import 'top_rated_list_view_test.mocks.dart';

@GenerateMocks([TopRatedMovieCubit])
void main() {
  late MockTopRatedMovieCubit mockTopRatedMovieCubit;
  setUp((){
    mockTopRatedMovieCubit=MockTopRatedMovieCubit();
    when(mockTopRatedMovieCubit.stream).thenAnswer((_)=>Stream.empty());
  });
   mackWidget(){
return MaterialApp(
  home: BlocProvider<TopRatedMovieCubit>(
    create: (context) => mockTopRatedMovieCubit,
    child: TopRatedList()),
);
  }
  group("test top rated list view", (){
testWidgets("should return skeletonizer when loading", (tester)async{
when(mockTopRatedMovieCubit.state).thenReturn(TopRatedMovieLoading());
await tester.pumpWidget(mackWidget());
expect(find.byType(ListviewSkeltonizer), findsOneWidget);
});



    testWidgets("shows movie list when success", (tester) async {
      final tMovies = [
        MovieEntity(
          id: 1,
          title: "Test Movie",
          overview: "Overview",
          backdropPath: "backdrop.jpg",
          posterPath: "poster.jpg",
          releaseDate: "2025-11-07",
          popularity: 8.0,
          voteAverage: 7.5,
        ),
      ];

      when(mockTopRatedMovieCubit.state)
          .thenReturn(TopRatedMovieSuccess(tMovies));

      await tester.pumpWidget(mackWidget());
final imageFinder = find.byWidgetPredicate(
  (widget) =>
      widget is CustomImageContainer &&
      widget.imageUrl == 'backdrop.jpg',
);
expect(imageFinder, findsOneWidget);

      // تأكيد إن الـ ListView ظهرت
      expect(find.byType(ListView), findsOneWidget);



    });
   // ❌ الحالة 3: Failure
    testWidgets("shows error message when failure", (tester) async {
      when(mockTopRatedMovieCubit.state)
          .thenReturn(TopRatedMovieFailure("Something went wrong"));

      await tester.pumpWidget(mackWidget());

      expect(find.text("Something went wrong"), findsOneWidget);
    });
testWidgets("shows default error text when state is unknown", (tester) async {
  when(mockTopRatedMovieCubit.state).thenReturn(TopRatedMovieInitial()); // لو عندك الحالة دي

  await tester.pumpWidget(mackWidget());

  expect(find.text("error"), findsOneWidget);
});
  });
}