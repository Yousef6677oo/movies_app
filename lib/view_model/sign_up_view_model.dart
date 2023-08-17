import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_exception/internet_exception/no_internet.dart';
import '../custom_exception/sign_up_exceptions/email_already_in_use.dart';
import '../custom_exception/sign_up_exceptions/weak_password.dart';
import '../data/firebase_manager.dart';

class SignUpViewModel extends Cubit<SignUpViewState> {
  SignUpViewModel() : super(SignUpInitState());

  Future<void> signUp(String fullName, String mobileNumber, String email,String password) async {
    emit(SignUpLoadState());
    try {
      await FireBaseManager.signUpFireBase(fullName, mobileNumber, email, password);
      emit(SignUpSuccessState());
    } catch (exception) {
      if (exception is EmailAlreadyInUse) {
        emit(SignUpErrorState('email is already in use'));
        return;
      }
      if (exception is WeakPassword) {
        emit(SignUpErrorState('weak password'));
        return;
      }
      if (exception is NoInternet) {
        emit(SignUpErrorState('No internet connection'));
        return;
      }
      emit(SignUpErrorState(exception.toString()));
    }
  }
}

abstract class SignUpViewState {}

class SignUpInitState extends SignUpViewState {}

class SignUpLoadState extends SignUpViewState {}

class SignUpErrorState extends SignUpViewState {
  String errorMsg;

  SignUpErrorState(this.errorMsg);
}

class SignUpSuccessState extends SignUpViewState {
  SignUpSuccessState();
}
