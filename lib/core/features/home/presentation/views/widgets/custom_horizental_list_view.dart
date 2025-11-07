
import 'package:flutter/material.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';

class custom_horizonta_list_view extends StatelessWidget {
  const custom_horizonta_list_view({
    super.key,
    required this.movie,
  });

  final List<MovieEntity> movie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
