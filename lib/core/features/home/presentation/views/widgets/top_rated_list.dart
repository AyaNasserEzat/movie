import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_horizental_list_view.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_img_skeletonizer.dart';


class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
        builder: (context, state) {
     if (state is TopRatedMovieFailure) {
          return Center(child: Text(state.message));
        } else if (state is TopRatedMovieSuccess) {
          final movie=state.movies;
          return custom_horizonta_list_view(movie: movie);
        } else if (state is TopRatedMovieLoading) {
          return ListviewSkeltonizer();
        } else {
          return Text("error");
        }
        },
      ),
    );
  }
}
