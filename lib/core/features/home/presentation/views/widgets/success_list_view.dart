
import 'package:flutter/material.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_item_container.dart';

class SuccessListView extends StatelessWidget {
  const SuccessListView({
    super.key,
    required this.movie,
  });

  final List<MovieEntity> movie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movie.length,
      itemBuilder: (buildContext, index) {
        return Center(
          child: FilmItemContainer(movieEntity: movie[index]),
    
        );
      
      },
    );
  }
}
