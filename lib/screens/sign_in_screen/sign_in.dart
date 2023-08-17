import 'package:flutter/material.dart';
import 'package:movies/utilities/app_colors.dart';
import 'package:movies/view_model/sign_in_view_model.dart';

import '../../components/custom_authentication_textField.dart';
import '../../components/custom_elevatedButton.dart';
import '../../utilities/validation_utils.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignIn extends StatefulWidget {
  SignInViewModel viewModel;
  SignIn(this.viewModel);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController =
      TextEditingController(text: 'yousefahmed@gmail.com');

  TextEditingController passwordController =
      TextEditingController(text: 'yousefahmedkamel137');

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
                    'assets/movie_icon.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
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
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomElevatedButton(
                    elevatedButtonText: 'Login',
                    elevatedButtonFunction: logIn,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Text(
                        "Don’t have an account? Create Account",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.17,
                            color: AppColors.whiteColor),
                      ))
                ],
              ),
            ),
          )),
    );
  }

  Future<void> logIn() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await widget.viewModel.signIn(emailController.text, passwordController.text);
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
