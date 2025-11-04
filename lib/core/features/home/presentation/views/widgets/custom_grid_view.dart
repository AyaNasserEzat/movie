import 'package:flutter/material.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.movies});
final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                  itemCount: movies.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: .6,
                  ),
                  itemBuilder: (context, index) {
                   
                    return CustomImageContainer(
                      imageUrl:
                          movies[index].backdropPath,
                    );
          
                  },


                );}
}