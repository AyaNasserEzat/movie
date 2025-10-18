import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMovieCubit()..getPopularMovie(),
      child: SizedBox(
        height: 180,
        child:BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieSuccess) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
                itemBuilder: (buildContext, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: CustomImageContainer(imageUrl: state.movies[index].backdropPath),
                  );
                },
              );
            } else if (state is PopularMovieFailure) {
              return Center(child: Text(state.message));
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}