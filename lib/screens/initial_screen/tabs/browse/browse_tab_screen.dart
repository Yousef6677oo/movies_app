import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/browse_tab_view_model.dart';
import 'browse_tab.dart';

class BrowseTabScreen extends StatelessWidget {
  BrowseTapViewModel browseTapViewModel = BrowseTapViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<BrowseTapViewModel, BrowseTabState>(
        bloc: browseTapViewModel,
        builder: (context, state) {
          if (state is BrowseTabLoadState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BrowseTabSuccessState) {
            return BrowseTab(state.genreResponseList);
          }
          return Container();
        },
      ),
    );
  }
}
