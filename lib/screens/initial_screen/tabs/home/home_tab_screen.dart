import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/home_tab_view_model.dart';
import 'home_tab.dart';

class HomeTabScreen extends StatelessWidget {
  HomeTapViewModel homeTapViewModel = HomeTapViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<HomeTapViewModel,HomeTabState>(
        bloc: homeTapViewModel,
        builder: (context, state) {
          if(state is HomeTabLoadState){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is HomeTabSuccessState){
            return HomeTab(state.resultList);
          }
          return Container();
        },
      ),
    );
  }
}
