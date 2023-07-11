import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api_manager.dart';

import '../model/DiscoverResponseDM.dart';

class BrowseSpecificCategoryViewModel
    extends Cubit<BrowseSpecificCategoryTabState> {

  BrowseSpecificCategoryViewModel() :super(BrowseSpecificCategoryTabLoadState()) {
    getAllBrowseSpecificCategory();
  }

  getAllBrowseSpecificCategory() async {
    //print("getAllBrowseSpecificCategory");
    DiscoverDM discoverResponse = await ApiManager.getDiscover("28");
    //print("discoverResponse: $discoverResponse");

    List<Result> discoverResponseList = discoverResponse.results!;
    emit(BrowseSpecificCategoryTabSuccessState(discoverResponseList));
  }
}

abstract class BrowseSpecificCategoryTabState {}

class BrowseSpecificCategoryTabLoadState
    extends BrowseSpecificCategoryTabState {}

class BrowseSpecificCategoryTabErrorState
    extends BrowseSpecificCategoryTabState {}

class BrowseSpecificCategoryTabSuccessState
    extends BrowseSpecificCategoryTabState {
  List<Result> discoverResponseList;

  BrowseSpecificCategoryTabSuccessState(this.discoverResponseList);
}
