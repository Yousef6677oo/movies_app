import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/firebase_manager.dart';

class SignUpViewModel extends Cubit<SignUpViewState> {
  SignUpViewModel() : super(SignUpInitState());

  Future<void>signUp(String fullName, String mobileNumber, String email, String password) async {
    emit(SignUpLoadState());
    try {
      await FireBaseManager.signUpFireBase(fullName, mobileNumber, email, password);
      emit(SignUpSuccessState());
    }catch (exception) {
      emit(SignUpErrorState("email is already in use"));
    }
  }
}

abstract class SignUpViewState {}


class SignUpInitState extends SignUpViewState{}

class SignUpLoadState extends SignUpViewState {}

class SignUpErrorState extends SignUpViewState {
  String errorMsg;

  SignUpErrorState(this.errorMsg);
}

class SignUpSuccessState extends SignUpViewState {
  SignUpSuccessState();
}

