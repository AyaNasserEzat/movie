
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_img_skeletonizer.dart';
import 'package:movies/core/features/home/presentation/views/widgets/popular_list_view.dart';
import '../../cubits/now_playing_cubit_test.mocks.dart';
import 'popuar_list_view_test.mocks.dart';



@GenerateMocks([PopularMovieCubit])
void main() {
  late MockPopularMovieCubit mockPopularMovieCubit;
  late MockNowPlayingUseCase mockNowPlayingUseCase;
  setUp((){
mockPopularMovieCubit=MockPopularMovieCubit();
when(mockPopularMovieCubit.stream).thenAnswer((_)=>Stream.empty());
  });
  // 💡 الويدجت الذي سنختبره
  Widget makeTestableWidget(Widget child) {
    return  MaterialApp(
      home: BlocProvider<PopularMovieCubit>.value(
        value: mockPopularMovieCubit,
        child: child,
      ),
    );
  }
  group("popular movie list view", (){
testWidgets("show return skeletonizer loading", (tester)async{
when(mockPopularMovieCubit.state).thenReturn(PopularMovieLoading());
await tester.pumpWidget(makeTestableWidget(PopularListView()));
expect(find.byType(ListviewSkeltonizer), findsOneWidget);

});
    // ✅ الحالة 2: Success
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

      when(mockPopularMovieCubit.state)
          .thenReturn(PopularMovieSuccess(tMovies));

      await tester.pumpWidget(makeTestableWidget(const PopularListView()));
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
      when(mockPopularMovieCubit.state)
          .thenReturn(PopularMovieFailure("Something went wrong"));

      await tester.pumpWidget(makeTestableWidget(const PopularListView()));

      expect(find.text("Something went wrong"), findsOneWidget);
    });

  });
  
}