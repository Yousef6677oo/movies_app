import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/custom_exception/internet_exception/no_internet.dart';
import 'package:movies/data/firebase_manager.dart';

import '../custom_exception/sign_in_exceptions/user_not_found.dart';
import '../custom_exception/sign_in_exceptions/wrong_password.dart';

class SignInViewModel extends Cubit<SignInViewState> {
  SignInViewModel() : super(SignInInitState());

  signIn(String email, String password) async {
    emit(SignInLoadState());
    try {
      await FireBaseManager.signIn(email, password);
      emit(SignInSuccessState());
    } catch (exception) {
      if (exception is UserNotFound) {
        emit(SignInErrorState('email is wrong.'));
        return;
      }
      if (exception is WrongPassword) {
        emit(SignInErrorState('password is wrong.'));
        return;
      }
      if (exception is NoInternet) {
        emit(SignInErrorState('No internet connection'));
        return;
      }
      emit(SignInErrorState(exception.toString()));
    }
  }
}

abstract class SignInViewState {}

class SignInInitState extends SignInSuccessState {}

class SignInLoadState extends SignInViewState {}

class SignInErrorState extends SignInViewState {
  String errorMsg;
  SignInErrorState(this.errorMsg);
}

class SignInSuccessState extends SignInViewState {
  SignInSuccessState();
}
