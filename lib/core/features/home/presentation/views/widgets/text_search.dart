import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_cubit.dart';

class TextSearch extends StatelessWidget {
   TextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<SearchCubit>(context).searh(value);
      },
  cursorColor: AppColor.white,
    style: const TextStyle(
    color: Colors.white, // 👈 ده لون الكتابة نفسها
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: AppColor.gery),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.gery),
        borderRadius: BorderRadius.circular(15)) ,
        hintText: "search...",
        hintStyle: TextStyle(color: AppColor.gery),
        prefixIcon: Icon(Icons.search,color: AppColor.gery,),
        border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.gery),
        borderRadius: BorderRadius.circular(15)),
        focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: AppColor.gery),
        borderRadius: BorderRadius.circular(15)),
      ),
      
    );
  }
}