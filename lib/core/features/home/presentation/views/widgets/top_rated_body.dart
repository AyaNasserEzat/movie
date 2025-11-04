import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';

import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_item_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopRatedBody extends StatelessWidget {
  const TopRatedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
      builder: (context, state) {
        final movie =
            state is TopRatedMovieSuccess
                ? state.movies
                : List.filled(
                  4,
                  MovieEntity(
                    backdropPath: "",
                    id: 1,
                    overview: "overview",
                    popularity: 6.8,
                    posterPath: "",
                    releaseDate: "releaseDate",
                    title: "title",
                    voteAverage: 4,
                  ),
                );
        if (state is TopRatedMovieFailure) {
          return Center(child: Text(state.message));
        }
        return RefreshIndicator(
          
          onRefresh: () { 
           return BlocProvider.of<TopRatedMovieCubit>(context).getTopRatedMovie();
           },
          child: Skeletonizer(
            enabled: state is TopRatedMovieLoading,
            effect: ShimmerEffect(
              baseColor: const Color.fromARGB(255, 77, 76, 76),
              highlightColor: Colors.grey,
            ),
          
            ignoreContainers: true,
            child: ListView.builder(
              itemCount: movie.length,
              itemBuilder: (buildContext, index) {
                return Center(
                  child: FilmItemContainer(movieEntity: movie[index]),
                  //Container(child: Text(state.movies[index].title)),
                );
              },
            ),
          ),
        );
        
      },
    );
  }
}
