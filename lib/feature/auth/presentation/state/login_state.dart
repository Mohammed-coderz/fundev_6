import '../../data/model/login_model.dart';

abstract class LoginState {}

class OnInitialLoginState extends LoginState {}

class OnLoadingLoginState extends LoginState {}

class OnLoadedLoginState extends LoginState {
  LoginModel user;
  OnLoadedLoginState({required this.user});
}

class OnErrorLoginState extends LoginState {
  final String errorMessage;

  OnErrorLoginState(this.errorMessage);
}
