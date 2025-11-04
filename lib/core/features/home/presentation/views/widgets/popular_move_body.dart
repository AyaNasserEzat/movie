import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_item_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularMoveBody extends StatelessWidget {
  const PopularMoveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        bool isLodding=state is PopularMovieLoading;
               final movie=state is PopularMovieSuccess? state.movies:List.filled(4, MovieEntity(backdropPath: "", id: 1, overview: "overview", popularity: 6.8, posterPath: "", releaseDate: "releaseDate", title: "title", voteAverage: 4));
            if (state is PopularMovieFailure) {
              return Center(child: Text(state.message));
            } 
    
          return Skeletonizer(
            enabled:isLodding,
           ignoreContainers: true,
            //state is PopularMovieLoading,
            effect: ShimmerEffect(baseColor: AppColor.shimmer),
          
            child: ListView.builder(
              itemCount: movie.length,
              itemBuilder: (buildContext, index) {
                return Center(
                  child: FilmItemContainer(movieEntity: movie[index]),
                  //Container(child: Text(state.movies[index].title)),
                );
              },
            ),
          );
      
      },
    );
  }
}
