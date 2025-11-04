
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/popular_movie_cubit/popular_movie_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';

import 'package:skeletonizer/skeletonizer.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMovieCubit()..getPopularMovie(),
      child: SizedBox(
        height: 180,
        child: BlocBuilder<PopularMovieCubit, PopularMovieState>(

          builder: (context, state) {
            final movie=state is PopularMovieSuccess? state.movies:List.filled(4, MovieEntity(backdropPath: "", id: 1, overview: "overview", popularity: 6.8, posterPath: "", releaseDate: "releaseDate", title: "title", voteAverage: 4));
            if (state is PopularMovieFailure) {
              return Center(child: Text(state.message));
            } 
          else{
            // bool isSuccess=state is PopularMovieSuccess;

            bool isLodding=state is PopularMovieLoading;
              return Skeletonizer(
                enabled: isLodding,
                effect: ShimmerEffect(baseColor: const Color.fromARGB(255, 77, 76, 76),highlightColor: Colors.grey),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movie.length,
                  itemBuilder: (buildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                     child:
                       CustomImageContainer(
                        imageUrl:  movie[index].backdropPath ,
                                             )
                    );
                  },
                ),
              );
          }
          },
        ),
      ),
    );
  }
} 
