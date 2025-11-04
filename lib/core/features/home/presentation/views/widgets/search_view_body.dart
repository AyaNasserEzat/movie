import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/contstant/app_color.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:movies/core/features/home/presentation/cubits/search_cubit/search_state.dart';
import 'package:movies/core/features/home/presentation/views/widgets/custom_grid_view.dart';
import 'package:movies/core/features/home/presentation/views/widgets/text_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Find Your \n movie",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColor.white),),
                SizedBox(height: 20,),
                TextSearch(),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchdMovieSuccess) {
                      final movies = state.movies;
                      return movies.isNotEmpty?
                      CustomGridView(movies: movies): Center(child: Text("not found"));
                    }
                  
                  else if (state is SearchMovieFailure) {
                  return Center(child: Text(state.message));
                } else if(state is SearchLoading){
                  return CircularProgressIndicator();
                }
                else{
          return  Text("");
                }
                  }
                ),
        
              ],
            ),
      ),
    );
  }
}