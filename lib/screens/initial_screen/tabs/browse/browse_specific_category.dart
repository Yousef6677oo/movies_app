import 'package:flutter/material.dart';
import '../../../../model/DiscoverResponseDM.dart';

class BrowseSpecificCategory extends StatelessWidget {
  static String routeName = "browseSpecificCategory";
  List<Result>? result;
  BrowseSpecificCategory();
  BrowseSpecificCategory.result({required this.result});

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Column(
        children: [
          Text("FFFFFFFFFFFFFFFFFFF:${result?[0].title}")
        ],
      ),
    );
  }
}
