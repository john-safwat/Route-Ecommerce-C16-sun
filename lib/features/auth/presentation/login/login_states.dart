class LoginStates {
  bool navigateToRegister;

  LoginStates({this.navigateToRegister = false});

  LoginStates copyWith({bool? navigateToRegister}) {
    return LoginStates(
      navigateToRegister: navigateToRegister ?? this.navigateToRegister,
    );
  }
}

sealed class LoginEvents {}

class NavigateToRegisterScreenEvent extends LoginEvents {}
