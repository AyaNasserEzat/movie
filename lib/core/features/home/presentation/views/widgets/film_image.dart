import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/database/api/dio_concumer.dart';
import 'package:movies/core/features/home/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movies/core/features/home/data/repo/movie_repo_imp.dart';
import 'package:movies/core/features/home/domain/use_case/now_playing_use_case.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_Playing_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/now_playing_cubit/now_playing_move_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_stack.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilmImage extends StatelessWidget {
  const FilmImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingMovieCubit(
        NowPlayingUseCase(
          movieRepo: MovieRepoImp(
            movieRemoteDataSource: MovieRemoteDataSourceImp(
              api: DioConcumer(dio: Dio()),
            ),
          ),
        )
      )..getNowPlayingMovie(),
      child: BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
        builder: (context, state) {
          // تحديد الحالة
          final isLoading = state is NowPlayingMovieLoading;
          final isSuccess = state is NowPlayingMovieSuccess;
          final isFailure = state is NowPlayingMovieFailure;

          // لو حصل خطأ نعرض رسالة فقط
          if (isFailure) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // بيانات الأفلام أو بيانات وهمية وقت التحميل
          final movies = isSuccess
              ? state.movies
              : List.generate(3, (index) => null); // fake data for skeleton

          // عرض Skeleton + Carousel في نفس الوقت
          return Skeletonizer(
            enabled: isLoading,
                            effect: ShimmerEffect(baseColor: const Color.fromARGB(255, 77, 76, 76),highlightColor: Colors.grey),
               ignoreContainers: true,
            child: CarouselSlider(
              items: movies.map((movie) {
                if (movie == null) {
                  // placeholder أثناء التحميل
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  );
                } else {
                  // بيانات حقيقية
                  return CustomStack(movieEntity: movie);
                }
              }).toList(),
              options: CarouselOptions(
                height: 360,
                autoPlay: isSuccess,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          );
        },
      ),
    );
  }
}
