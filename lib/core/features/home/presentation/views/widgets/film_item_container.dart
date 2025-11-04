import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_image_container.dart';
import 'package:movies/core/features/home/presentation/views/widgets/year_container.dart';

class FilmItemContainer extends StatelessWidget {
  const FilmItemContainer({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.push("/movieDetails",extra: movieEntity.id);
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.greylight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 15,
              children: [
                CustomImageContainer(imageUrl: movieEntity.backdropPath),

                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        movieEntity.title,
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          YearContainer(text: movieEntity.releaseDate,),
                          SizedBox(width: 10),
                          Icon(Icons.star, color: AppColor.yellow, size: 18),
                          SizedBox(width: 3),
                          Text(
                            movieEntity.voteAverage.toStringAsFixed(1),
                            style: TextStyle(color: AppColor.white),
                          ),
                        ],
                      ),
                      Text(
                        maxLines: 2,
                        movieEntity.overview,
                        style: TextStyle(
                          color: AppColor.gery,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
