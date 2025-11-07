import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/list_view_loading.dart';
import 'package:movies/core/features/home/presentation/views/widgets/success_list_view.dart';


class TopRatedBody extends StatelessWidget {
  const TopRatedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
      builder: (context, state) {
       if (state is TopRatedMovieFailure) {
          return Center(child: Text(state.message));
        } else if (state is TopRatedMovieSuccess) {
          final movie = state.movies;
          return SuccessListView(movie: movie);
        } else if (state is TopRatedMovieLoading) {
          return ListViewLoading();
        } else {
         return Text("erreo");
        }
        
      },
    );
  }
}
