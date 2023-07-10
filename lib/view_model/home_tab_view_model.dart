import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/model/PopularResponseDM.dart';

class HomeTapViewModel extends Cubit<HomeTabState> {
  HomeTapViewModel() : super(HomeTabLoadState()) {
     getAllMovies();
  }

  getAllMovies() async {
    PopularDM response = await ApiManager.getPopular();
    List<Result> resultList = response.results!;
    emit(HomeTabSuccessState(resultList));
  }
}

abstract class HomeTabState {}

class HomeTabLoadState extends HomeTabState {}

class HomeTabErrorState extends HomeTabState {}

class HomeTabSuccessState extends HomeTabState {
  List<Result> resultList;
  HomeTabSuccessState(this.resultList);
}
