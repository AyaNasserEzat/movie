import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';

import 'package:movies/core/features/home/presentation/views/widgets/list_view_loading.dart';
import 'package:movies/core/features/home/presentation/views/widgets/success_list_view.dart';


class PopularMoveBody extends StatelessWidget {
  const PopularMoveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieFailure) {
          return Center(child: Text(state.message));
        } else if (state is PopularMovieSuccess) {
          final movie = state.movies;
          return SuccessListView(movie: movie);
        } else if (state is PopularMovieLoading) {
          return ListViewLoading();
        } else {
         return Text("erreo");
        }
      },
    );
  }
}
