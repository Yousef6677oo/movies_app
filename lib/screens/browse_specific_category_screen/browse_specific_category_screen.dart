import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/browseDM.dart';
import '../../view_model/browse_specific_category_screen_view_model.dart';
import 'browse_specific_category.dart';

class BrowseSpecificCategoryScreen extends StatelessWidget {
  static String routeName = "browseSpecificCategoryScreen";

  @override
  Widget build(BuildContext context) {
    BrowseDM args = ModalRoute.of(context)!.settings.arguments as BrowseDM;

    BrowseSpecificCategoryScreenViewModel
        browseSpecificCategoryScreenViewModel =
        BrowseSpecificCategoryScreenViewModel(args.genreID);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<BrowseSpecificCategoryScreenViewModel,
          BrowseSpecificCategoryScreenState>(
        bloc: browseSpecificCategoryScreenViewModel,
        builder: (context, state) {
          if (state is BrowseSpecificCategoryLoadState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color(0xffFFBB3B),
            ));
          }
          if (state is BrowseSpecificCategorySuccessState) {
            return BrowseSpecificCategory(
                state.genreResponseList, args.categoryName);
          }
          return Container();
        },
      ),
    );
  }
}
