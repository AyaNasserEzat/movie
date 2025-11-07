import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_horizental_list_view.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_img_skeletonizer.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: BlocBuilder<PopularMovieCubit, PopularMovieState>(
        builder: (context, state) {

          if (state is PopularMovieFailure) {
            return Center(child: Text(state.message));
          } else if (state is PopularMovieSuccess) {
            final movie=state.movies;
            return custom_horizonta_list_view(movie: movie);
          } else if (state is PopularMovieLoading) {
            return ListviewSkeltonizer();
          } else {
            return Text("error");
          }
        },
      ),
    );
  }
}
