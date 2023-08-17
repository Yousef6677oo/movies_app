import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/firebase_manager.dart';

class SignInViewModel extends Cubit<SignInViewState>{
  SignInViewModel():super(SignInInitState());

  signIn(String email,String password) async {
    emit(SignInLoadState());
    try{
      await FireBaseManager.signIn(email, password);
      emit(SignInSuccessState());
    }catch(exception){
      emit(SignInErrorState(exception.toString()));
    }
  }
}

abstract class SignInViewState{

}

class SignInInitState extends SignInSuccessState{}

class SignInLoadState extends SignInViewState {}

class SignInErrorState extends SignInViewState {
  String errorMsg;
  SignInErrorState(this.errorMsg);
}

class SignInSuccessState extends SignInViewState {
  SignInSuccessState();
}