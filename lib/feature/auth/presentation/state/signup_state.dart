abstract class SignupState {}

class OnInitialSignupState extends SignupState {}

class OnLoadingSignupState extends SignupState {}

class OnLoadedSignupState extends SignupState {
  OnLoadedSignupState();
}

class OnErrorSignupState extends SignupState {
  final String errorMessage;

  OnErrorSignupState(this.errorMessage);
}
