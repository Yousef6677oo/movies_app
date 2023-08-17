import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomAuthenticationTextField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  String hintText;
  bool isPasswordTextField;
  Function validator;

  CustomAuthenticationTextField(
      {required this.labelText,
      required this.hintText,
      required this.isPasswordTextField,
      required this.controller,
      required this.validator});

  @override
  State<CustomAuthenticationTextField> createState() =>
      _CustomAuthenticationTextFieldState();
}

class _CustomAuthenticationTextFieldState
    extends State<CustomAuthenticationTextField> {
  late bool hidePassword;

  @override
  void initState() {
    widget.isPasswordTextField ? hidePassword = true : hidePassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.selectedTabColor),
        ),
        SizedBox(height: height * 0.015),
        TextFormField(
          validator: (value) {
            return widget.validator(value);
          },
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.unselectedTabColor),
          obscureText: hidePassword,
          showCursor: false,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.isPasswordTextField
                ? InkWell(
                    onTap: () {
                      hidePassword ? hidePassword = false : hidePassword = true;
                      setState(() {});
                    },
                    child: ImageIcon(
                      const AssetImage("assets/show_password.png"),
                      color: hidePassword
                          ? AppColors.unselectedTabColor
                          : AppColors.selectedTabColor,
                    ))
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            hintText: widget.hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
          ),
        )
      ],
    );
  }
}
