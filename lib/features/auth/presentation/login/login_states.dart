import 'package:route_e_commerce_v2/core/network/Resources.dart';

class LoginStates {
  Resources<String> loginResource;

  LoginStates({this.loginResource = const Resources.initial()});

  LoginStates copyWith({Resources<String>? loginResource}) {
    return LoginStates(loginResource: loginResource ?? this.loginResource);
  }
}

sealed class LoginEvents {}

class NavigateToRegisterScreenEvent extends LoginEvents {}

class Login extends LoginEvents {
  final String email;
  final String password;

  Login(this.email, this.password);
}

sealed class LoginNavigationEvents {}

class NavigateToRegister extends LoginNavigationEvents {}

class NavigateToHome extends LoginNavigationEvents {}

class ShowErrorMessage extends LoginNavigationEvents {
  final String message;

  ShowErrorMessage(this.message);
}
