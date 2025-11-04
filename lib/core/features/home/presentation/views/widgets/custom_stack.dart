import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/film_name_colom.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset("assets/cartoon_test.jpg",width: double.infinity,height: 360,fit: BoxFit.cover,),
        CachedNetworkImage(
          imageUrl:
              "https://image.tmdb.org/t/p/w500${movieEntity.backdropPath}",
          width: double.infinity,
          height: 360,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 360,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade900,
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 50,
          right: 50,
          child: FilmNameColom(text: movieEntity.title),
        ),
      ],
    );
  }
}
