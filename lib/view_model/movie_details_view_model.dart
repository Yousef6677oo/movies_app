import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';

import '../model/SimilarResponseDM.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  int genreID;

  MovieDetailsViewModel(this.genreID) : super(MovieDetailsLoadState()) {
    getAllDiscover();
  }

  getAllDiscover() async {
    SimilarDM similarResponse = await ApiManager.getSimilar(genreID);
    List<Result> similarResponseList = similarResponse.results!;

    emit(MovieDetailsSuccessState(similarResponseList));
  }
}

abstract class MovieDetailsState {}

class MovieDetailsLoadState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  List<Result> similarResponseList;

  MovieDetailsSuccessState(this.similarResponseList);
}
