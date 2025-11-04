import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.shimmer,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}