import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';
import 'package:movies/model/LatestResponseDM.dart';
import 'package:movies/model/PopularResponseDM.dart';

class HomeTapViewModel extends Cubit<HomeTabState> {
  HomeTapViewModel() : super(HomeTabLoadState()) {
     getAllMovies();
  }

  getAllMovies() async {
    PopularDM popularResponse = await ApiManager.getPopular('3/movie/popular');
    List<Result> resultResponseList = popularResponse.results!;

    LatestDM releaseResponse = await ApiManager.getLatest();

    PopularDM recommendedResponse =
        await ApiManager.getPopular('3/movie/top_rated');
    List<Result> recommendedResponseList = recommendedResponse.results!;

    emit(HomeTabSuccessState(
        resultResponseList, releaseResponse, recommendedResponseList));
  }
}

abstract class HomeTabState {}

class HomeTabLoadState extends HomeTabState {}

class HomeTabErrorState extends HomeTabState {}

class HomeTabSuccessState extends HomeTabState {
  List<Result> resultResponseList;
  LatestDM releaseResponse;
  List<Result> recommendedResponseList;

  HomeTabSuccessState(this.resultResponseList, this.releaseResponse,
      this.recommendedResponseList);
}
