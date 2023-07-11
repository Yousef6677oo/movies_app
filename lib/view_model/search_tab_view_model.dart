import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';
import '../model/SearchResponseDM.dart';

class SearchTapViewModel extends Cubit<SearchTabState> {
  String query;
  SearchTapViewModel(this.query) : super(SearchTabLoadState()) {
    getAllSearchMovies();
  }

  getAllSearchMovies() async {
    SearchDM searchResponse = await ApiManager.getSearch(query);
    List<Result> resultResponseList = searchResponse.results!;
    
    emit(SearchTabSuccessState(resultResponseList));
  }
}

abstract class SearchTabState {}

class SearchTabLoadState extends SearchTabState {}

class SearchTabErrorState extends SearchTabState {}

class SearchTabSuccessState extends SearchTabState {
  List<Result> resultResponseList;

  SearchTabSuccessState(this.resultResponseList);
}
