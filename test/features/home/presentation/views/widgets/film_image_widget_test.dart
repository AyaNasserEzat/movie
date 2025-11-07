
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_Playing_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_playing_move_state.dart';

import 'package:movies/core/features/home/presentation/views/widgets/film_image.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_img_skeletonizer.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../cubits/now_playing_cubit_test.mocks.dart';
import 'film_image_widget_test.mocks.dart';

// قم بتوليد Mock لهذا Cubit
@GenerateMocks([NowPlayingMovieCubit])
void main() {
  late MockNowPlayingMovieCubit mockCubit;
late MockNowPlayingUseCase mockUseCase;
  final sl = GetIt.instance;

  setUp(() {
    mockCubit = MockNowPlayingMovieCubit();
    mockUseCase = MockNowPlayingUseCase();

    if (sl.isRegistered<NowPlayingUseCase>()) {
      sl.unregister<NowPlayingUseCase>();
    }
    sl.registerLazySingleton<NowPlayingUseCase>(() => mockUseCase);

  

    // ✅ ضروري علشان BlocBuilder يشتغل من غير MissingStubError
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());


   
  });
  // 💡 الويدجت الذي سنختبره
  Widget makeTestableWidget(Widget child) {
    return  MaterialApp(
      home: BlocProvider<NowPlayingMovieCubit>.value(
        value: mockCubit,
        child: child,
      ),
    );
  }

  testWidgets("'FilmImage shows Skeletonizer and placeholders when state is Loading", (tester)async{
    when(mockCubit.state).thenReturn(NowPlayingMovieLoading());

    await tester.pumpWidget(makeTestableWidget(const FilmImage()));

    expect(find.byType(FilmImgSkeletonizer), findsOneWidget);
  });

  testWidgets("shows CarouselSlider when success'", (tester)async{
    final tMovie=[MovieEntity(backdropPath: "backdropPath", id: 1, overview: "overview", popularity: 2, posterPath: "posterPath", releaseDate: "releaseDate", title: "title", voteAverage: 5)];
when(mockCubit.state).thenReturn(NowPlayingMovieSuccess(tMovie));

    await tester.pumpWidget(makeTestableWidget(const FilmImage()));

    expect(find.byType(CarouselSlider), findsOneWidget);

  });

    // 🧩 الحالة 3: Failure
  testWidgets('FilmImage shows error message when failure',
      (WidgetTester tester) async {
    when(mockCubit.state)
        .thenReturn(NowPlayingMovieFailure('Something went wrong'));

    await tester.pumpWidget(makeTestableWidget(const FilmImage()));

    expect(find.text('Something went wrong'), findsOneWidget);
  });

}