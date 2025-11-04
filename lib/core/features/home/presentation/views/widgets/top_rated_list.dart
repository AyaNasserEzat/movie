import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/top_rated_cubit/top_rated_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopRatedMovieCubit()..getTopRatedMovie(),
      child: SizedBox(
        height: 180,
        child: BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
          builder: (context, state) {
            if (state is TopRatedMovieFailure) {
              return Center(child: Text(state.message));
            }
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

            return Skeletonizer(
              enabled: state is TopRatedMovieLoading,
              effect: ShimmerEffect(
                baseColor: const Color.fromARGB(255, 77, 76, 76),
                highlightColor: Colors.grey,
              ),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.length,
                itemBuilder: (buildContext, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: CustomImageContainer(
                      imageUrl: movie[index].backdropPath,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
