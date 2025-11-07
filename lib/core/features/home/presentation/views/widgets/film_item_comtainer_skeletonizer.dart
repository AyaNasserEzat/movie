import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_img_skeletonizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilmItemComtainerSkeletonizer extends StatelessWidget {
  const FilmItemComtainerSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: const Color.fromARGB(255, 77, 76, 76),
        highlightColor: Colors.grey,
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                CustomImgSkeletonizer(),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "looding...",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        ),
                      ),
                      Row(children: [Text("loddind....")]),
                      Text(
                        maxLines: 2,
                        "lodding......................",
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
