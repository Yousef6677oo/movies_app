import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/view_model/sign_up_view_model.dart';

import '../../components/custom_authentication_textField.dart';
import '../../components/custom_elevatedButton.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/validation_utils.dart';

class SignUp extends StatefulWidget {
  SignUpViewModel viewModel;
  SignUp(this.viewModel);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Image.asset(
                    'assets/ticket_icon.png',
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAuthenticationTextField(
                    labelText: 'Full Name',
                    hintText: 'enter your full name',
                    isPasswordTextField: false,
                    controller: fullNameController,
                    validator: validateFullNameTextField,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAuthenticationTextField(
                    labelText: 'Mobile Number',
                    hintText: 'enter your mobile no.',
                    isPasswordTextField: false,
                    controller: mobileNumberController,
                    validator: validateMobileNumberTextField,
                  ), /////
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAuthenticationTextField(
                    labelText: 'Email',
                    hintText: 'enter your email',
                    isPasswordTextField: false,
                    controller: emailController,
                    validator: validateEmailTextField,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAuthenticationTextField(
                    labelText: 'Password',
                    hintText: 'enter your password',
                    isPasswordTextField: true,
                    controller: passwordController,
                    validator: validatePasswordTextField,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CustomElevatedButton(
                    elevatedButtonText: 'Login',
                    elevatedButtonFunction: register,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> register() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await widget.viewModel.signUp(
        fullNameController.text,
        mobileNumberController.text,
        emailController.text,
        passwordController.text);
  }

  String? validateFullNameTextField(String value) {
    if (ValidationUtils.isValidateFullName(value!) == true) {
      return 'Please a Enter Full Name';
    }
    if (value.length < 6) {
      return 'Please a Enter Valid Full Name';
    }
    return null;
  }

  String? validateMobileNumberTextField(String value) {
    if (ValidationUtils.isValidateMobileNumber(value!) == true) {
      return 'Please a Enter Mobile Number';
    }
    if (value.length < 6) {
      return 'Please a Enter Mobile Number';
    }
    return null;
  }

  String? validateEmailTextField(String value) {
    if (value!.isEmpty) {
      return 'Please a Enter Email';
    }
    if (ValidationUtils.isValidateEmail(value) == true) {
      return 'Please a Enter Valid Email';
    }
    return null;
  }

  String? validatePasswordTextField(String value) {
    if (ValidationUtils.isValidatePassword(value!) == true) {
      return 'Please a Enter Password';
    }
    if (value.length < 6) {
      return 'password should be at least 6 characters';
    }
    return null;
  }
}
