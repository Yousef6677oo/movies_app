import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';

import '../model/DetailsResponseDM.dart';
import '../model/SimilarResponseDM.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsViewState> {
  int genreID;

  MovieDetailsViewModel(this.genreID) : super(MovieDetailsLoadState()) {
    getAllDiscover();
  }

  getAllDiscover() async {
    emit(MovieDetailsLoadState());
    SimilarDM similarResponse = await ApiManager.getSimilar(genreID);
    List<Result> similarResponseList = similarResponse.results!;
    DetailsDM categories = await ApiManager.getDetails(genreID);
    List<String> genres = [];
    categories.genres?.forEach((element) {
      genres.add(element.name ?? '');
    });
    emit(MovieDetailsSuccessState(similarResponseList, genres));
  }
}

abstract class MovieDetailsViewState {}

class InitState  extends MovieDetailsViewState{}

class MovieDetailsLoadState extends MovieDetailsViewState {}

class MovieDetailsErrorState extends MovieDetailsViewState {}

class MovieDetailsSuccessState extends MovieDetailsViewState {
  List<Result> similarResponseList;
  List<String> genreList;

  MovieDetailsSuccessState(this.similarResponseList, this.genreList);
}