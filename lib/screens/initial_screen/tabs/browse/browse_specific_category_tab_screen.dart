import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/browse_specific_category_view_model.dart';
import 'browse_specific_category.dart';

class BrowseSpecificCategoryTabScreen extends StatelessWidget {
  BrowseSpecificCategoryViewModel browseSpecificCategoryViewModel = BrowseSpecificCategoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<BrowseSpecificCategoryViewModel,
          BrowseSpecificCategoryTabState>(
        bloc: browseSpecificCategoryViewModel,
        builder: (context, state) {
          if (state is BrowseSpecificCategoryTabLoadState) {
            print("BrowseSpecificCategoryTabLoadState:::: ");
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BrowseSpecificCategoryTabSuccessState) {
            print("state:::: ${state.discoverResponseList}");
            return BrowseSpecificCategory.result(
                result: state.discoverResponseList);
          }
          return Container();
        },
      ),
    );
  }
}
