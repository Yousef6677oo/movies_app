import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';

import '../model/GenreResponseDM.dart';

class BrowseTapViewModel extends Cubit<BrowseTabState> {
  BrowseTapViewModel() : super(BrowseTabLoadState()) {
    getAllBrowse();
  }

  getAllBrowse() async {
    GenreDM genreResponse = await ApiManager.getGenre();
    List<Genre> genreResponseList = genreResponse.genres!;

    emit(BrowseTabSuccessState(genreResponseList));
  }
}

abstract class BrowseTabState {}

class BrowseTabLoadState extends BrowseTabState {}

class BrowseTabErrorState extends BrowseTabState {}

class BrowseTabSuccessState extends BrowseTabState {
  List<Genre> genreResponseList;

  BrowseTabSuccessState(this.genreResponseList);
}
