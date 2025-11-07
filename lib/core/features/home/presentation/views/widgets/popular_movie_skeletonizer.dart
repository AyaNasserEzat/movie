import 'package:flutter/material.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_img_skeletonizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularMovieSkeletonizer extends StatelessWidget {
  const PopularMovieSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
                enabled: true,
                effect: ShimmerEffect(baseColor: const Color.fromARGB(255, 77, 76, 76),highlightColor: Colors.grey),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (buildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                     child:
                      CustomImgSkeletonizer()
                    );
                  },
                ));
  }
}