import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String query = "";

  search(String querySearch) {
    print("search provider: ${querySearch}");
    query = querySearch;
    notifyListeners();
  }
}
