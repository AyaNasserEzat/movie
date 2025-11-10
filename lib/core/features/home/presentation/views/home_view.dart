import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';
import 'package:movies/core/features/home/domain/use_case/popular_movie_usecase.dart';
import 'package:movies/core/features/home/domain/use_case/top_rated_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_Playing_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_row.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_image.dart';
import 'package:movies/core/features/home/presentation/views/widgets/popular_list_view.dart';
import 'package:movies/core/features/home/presentation/views/widgets/top_rated_list.dart';
import 'package:movies/core/servieces/serviec_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            BlocProvider(
                    create: (context) => NowPlayingMovieCubit(
        sl<NowPlayingUseCase>()
      )..getNowPlayingMovie(),
              child: FilmImage()),
            SizedBox(height: 10),
            CustomRow(
              text: "Popular",
              ontap: () {
                context.push("/popular");
              },
            ),
            BlocProvider(
                   create: (context) => PopularMovieCubit(
                    sl<PopularMovieUsecase>()
                   )..getPopularMovie(),
              child: PopularListView()),
            CustomRow(
              text: "Top Rated",
              ontap: () {
                context.push("/topRated");
              },
            ),
            BlocProvider(
                 create: (context) => TopRatedMovieCubit(sl<TopRatedUseCase>())..getTopRatedMovie(),
              child: TopRatedList()),
          ],
        ),
      ),
    );
  }
}
