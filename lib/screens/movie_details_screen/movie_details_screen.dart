import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/homeDM.dart';
import '../../view_model/movie_details_view_model.dart';
import 'movie_details.dart';

class MovieDetailsScreen extends StatelessWidget {
  static String routeName = "movieDetailsScreen";

  @override
  Widget build(BuildContext context) {
    HomeDataModel args =
        ModalRoute.of(context)!.settings.arguments as HomeDataModel;
    MovieDetailsViewModel movieDetailsViewModel =
        MovieDetailsViewModel(args.id);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<MovieDetailsViewModel, MovieDetailsViewState>(
        bloc: movieDetailsViewModel,
        builder: (context, state) {
          if (state is MovieDetailsLoadState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color(0xffFFBB3B),
            ));
          }
          if (state is MovieDetailsSuccessState) {
            return MovieDetails(args, state.similarResponseList, state.genreList);
          }
          return Container();
        },
      ),
    );
  }
}
