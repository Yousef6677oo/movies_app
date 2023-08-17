import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/sign_in_screen/sign_in.dart';
import 'package:movies/view_model/sign_in_view_model.dart';

import '../../utilities/dialog_utils.dart';
import '../initial_screen/initial_screen.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "signInScreen";
  SignInViewModel signInViewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<SignInViewModel, SignInViewState>(
          bloc: signInViewModel,
          listener: (context, state) {
            if (state is SignInSuccessState) {
              Navigator.pushReplacementNamed(context, InitialScreen.routeName);
            }
            if (state is SignInErrorState) {
              DialogUtils.showMessageDialog(context, state.errorMsg);
            }
            if (state is SignInLoadState) {
              DialogUtils.loadingDialog(context);
            }
          },
          listenWhen: (previous, current) {
            if (previous is SignInLoadState) {
              DialogUtils.hideDialog(context);
            }
            if (current is SignInInitState ||
                current is SignInLoadState ||
                current is SignInSuccessState ||
                current is SignInErrorState) {
              return true;
            }
            return false;
          },
          buildWhen: (previous, current) {
            if (current is SignInInitState ||
                current is SignInLoadState ||
                current is SignInSuccessState ||
                current is SignInErrorState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return SignIn(signInViewModel);
          }),
    );
  }
}
