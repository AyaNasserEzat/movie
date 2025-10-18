import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_item_container.dart';

class PopularMoveBody extends StatelessWidget {
  const PopularMoveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieSuccess) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (buildContext, index) {
                  return Center(
                    child: FilmItemContainer(movieEntity: state.movies[index],)
                    //Container(child: Text(state.movies[index].title)),
                  );
                },
              );
            } else if (state is PopularMovieFailure) {
              return Center(child: Text(state.message));
            } else {
              return CircularProgressIndicator();
            }
          },
        );
  }
}