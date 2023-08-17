import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/sign_up_screen/sign_up.dart';
import 'package:movies/view_model/sign_up_view_model.dart';

import '../../utilities/dialog_utils.dart';
import '../initial_screen/initial_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel signUpViewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<SignUpViewModel, SignUpViewState>(
        bloc: signUpViewModel,
        listener: (context,state){
          if(state is SignUpSuccessState){
            Navigator.pushReplacementNamed(context, InitialScreen.routeName);
          }
          if(state is SignUpErrorState){
            DialogUtils.showMessageDialog(context, state.errorMsg);
          }
          if(state is SignUpLoadState){
           DialogUtils.loadingDialog(context);
          }
        },
        listenWhen: (previous, current) {
          if(previous is SignUpLoadState){
            DialogUtils.hideDialog(context);
          }
          if (current is SignUpInitState ||
              current is SignUpLoadState ||
              current is SignUpSuccessState ||
              current is SignUpErrorState) {
            return true;
          }
          return false;
        },
        buildWhen: (previous, current) {
          if (current is SignUpInitState ||
              current is SignUpLoadState ||
              current is SignUpSuccessState ||
              current is SignUpErrorState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          return SignUp(signUpViewModel);
        },
      ),
    );
  }
}
