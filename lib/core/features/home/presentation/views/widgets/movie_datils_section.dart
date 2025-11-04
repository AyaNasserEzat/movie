import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';

import 'package:movies/core/features/home/domain/entitiy/movie_details_entity.dart';
import 'package:movies/core/features/home/presentation/views/widgets/year_container.dart';

class MovieDatilsSection extends StatelessWidget {
  const MovieDatilsSection({super.key, required this.movieDetailModel});
final MovieDetailsEntity movieDetailModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          SizedBox(height: 15),
          Text(
          movieDetailModel.title,
            style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Row(
            children: [
              YearContainer(text: movieDetailModel.releaseDate, color: AppColor.greylight),
              SizedBox(width: 10),
              Icon(Icons.star, color: AppColor.yellow, size: 18),
              SizedBox(width: 3),
              Text(movieDetailModel.voteAverage.toStringAsFixed(1), style: TextStyle(color: AppColor.white)),
                          SizedBox(width: 7),
              Text(" ${(movieDetailModel.runtime/60).toStringAsFixed(0)}h ${movieDetailModel.runtime%60}m", style: TextStyle(color: AppColor.gery)),
            ],
          ),
          Text(
            movieDetailModel.overview,
 style: TextStyle(color: AppColor.white),
          ),
        

         Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("Genres: ", style: TextStyle(color: AppColor.gery)),
    Expanded(
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: List.generate(movieDetailModel.genres.length, (index) {
          final word = movieDetailModel.genres[index].name;
          final isLast = index == movieDetailModel.genres.length - 1;
          return Text(
            isLast ? word : "$word,",
            style: TextStyle(color: AppColor.gery),
          );
        }),
      ),
    ),
  ],
)


        ],
      ),
    );
  }
}
