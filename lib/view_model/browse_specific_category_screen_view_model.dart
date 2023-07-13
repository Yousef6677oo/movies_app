import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';

import '../model/DiscoverResponseDM.dart';

class BrowseSpecificCategoryScreenViewModel
    extends Cubit<BrowseSpecificCategoryScreenState> {
  String genreID;

  BrowseSpecificCategoryScreenViewModel(this.genreID)
      : super(BrowseSpecificCategoryLoadState()) {
    getAllBrowse();
  }

  getAllBrowse() async {
    DiscoverDM browseResponse = await ApiManager.getDiscover(genreID);
    List<Result> browseResponseList = browseResponse.results!;

    emit(BrowseSpecificCategorySuccessState(browseResponseList));
  }
}

abstract class BrowseSpecificCategoryScreenState {}

class BrowseSpecificCategoryLoadState
    extends BrowseSpecificCategoryScreenState {}

class BrowseSpecificCategoryState extends BrowseSpecificCategoryScreenState {}

class BrowseSpecificCategorySuccessState
    extends BrowseSpecificCategoryScreenState {
  List<Result> genreResponseList;

  BrowseSpecificCategorySuccessState(this.genreResponseList);
}
