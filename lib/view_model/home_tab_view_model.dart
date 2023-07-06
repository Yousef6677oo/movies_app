import 'package:flutter/material.dart';

import '../data/api_manager.dart';
import '../model/PopularResponseDM.dart';

class HomeTabViewModel extends ChangeNotifier {
  bool isLoading = false;
  String errorMessage = "";

  Future<PopularDM> getPopular() async {
    isLoading = true;
    PopularDM popularDM = await ApiManager.getPopular();
    if (popularDM.statusCode != null ||
        popularDM.statusMessage != null ||
        popularDM.success != null) {
      errorMessage = popularDM.statusMessage!;
    }
    return popularDM;
  }
}
