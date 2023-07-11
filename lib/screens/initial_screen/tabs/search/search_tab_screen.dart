import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/initial_screen/tabs/search/search_tab.dart';
import '../../../../view_model/search_tab_view_model.dart';

class SearchTabScreen extends StatelessWidget {
  SearchTapViewModel searchTapViewModel = SearchTapViewModel("fast and furious");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<SearchTapViewModel,SearchTabState>(
        bloc: searchTapViewModel,
        builder: (context, state) {
          if (state is SearchTabLoadState) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffFFBB3B),
                ));
          }
          if (state is SearchTabSuccessState) {
            return SearchTab(state.resultResponseList);
          }
          return Container();
        },
      ),
    );
  }
}
