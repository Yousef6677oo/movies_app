import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  String elevatedButtonText;
  Function elevatedButtonFunction;

  CustomElevatedButton(
      {required this.elevatedButtonText, required this.elevatedButtonFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
        onPressed: () {
          elevatedButtonFunction();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.3,
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Text(elevatedButtonText,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColors.selectedTabColor)),
        ));
  }
}
