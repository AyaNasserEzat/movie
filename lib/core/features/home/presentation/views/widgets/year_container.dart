import 'package:flutter/material.dart';
import 'package:movies/core/contstant/app_color.dart';

class YearContainer extends StatelessWidget {
  const YearContainer({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
  width: 60,
  height: 25,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: AppColor.red
  ),
  child: Center(child: Text(text.substring(0,4),style: TextStyle(color: AppColor.white),)),
);
  }
}