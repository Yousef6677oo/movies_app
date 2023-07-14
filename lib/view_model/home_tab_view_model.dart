import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/model/PopularResponseDM.dart';

class HomeTapViewModel extends Cubit<HomeTabState> {
  HomeTapViewModel() : super(HomeTabLoadState()) {
     getAllMovies();
  }

  getAllMovies() async {
    PopularDM popularResponse = await ApiManager.getPopular('3/movie/popular');
    List<Result> resultResponseList = popularResponse.results!;

    PopularDM recommendedResponse =
        await ApiManager.getPopular('3/movie/top_rated');
    List<Result> recommendedResponseList = recommendedResponse.results!;

    PopularDM upcomingResponse =
        await ApiManager.getPopular('3/movie/upcoming');
    List<Result> upcomingResponseList = upcomingResponse.results!;

    emit(HomeTabSuccessState(
        resultResponseList, recommendedResponseList, upcomingResponseList));
  }
}

abstract class HomeTabState {}

class HomeTabLoadState extends HomeTabState {}

class HomeTabErrorState extends HomeTabState {}

class HomeTabSuccessState extends HomeTabState {
  List<Result> resultResponseList;
  List<Result> recommendedResponseList;
  List<Result> upcomingResponseList;

  HomeTabSuccessState(this.resultResponseList, this.recommendedResponseList,
      this.upcomingResponseList);
}
