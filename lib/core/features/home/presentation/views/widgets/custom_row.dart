import 'package:flutter/material.dart';

import 'package:movies/core/contstant/app_color.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.text, this.ontap});
  final String text;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(color: AppColor.white, fontSize: 18)),
          InkWell(
            onTap: ontap,
            child: Row(
              children: [
                Text(
                  "See More ",
                  style: TextStyle(color: AppColor.white, fontSize: 10),
                ),

                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 10,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
