import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImgSkeletonizer extends StatelessWidget {
  const CustomImgSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: const Color.fromARGB(255, 77, 76, 76),
        highlightColor: Colors.grey,
      ),
      ignoreContainers: false,
      child: AspectRatio(
        aspectRatio: 2.9 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset("assets/cartoon_test.jpg",fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
class ListviewSkeltonizer extends StatelessWidget {
  const ListviewSkeltonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (buildContext, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                   child:
CustomImgSkeletonizer()
                  );
                },
              );
  }
}