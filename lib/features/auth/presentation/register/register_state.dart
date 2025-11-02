import 'package:route_e_commerce_v2/core/network/Resources.dart';

class RegisterState {
  bool passwordVisible;
  bool rePasswordVisible;
  Resources<String> registerResources;

  RegisterState({
    this.passwordVisible = false,
    this.rePasswordVisible = false,
    this.registerResources = const Resources.initial(),
  });

  RegisterState copyWith({
    bool? passwordVisible,
    bool? rePasswordVisible,
    Resources<String>? registerResources,
  }) {
    return RegisterState(
      passwordVisible: passwordVisible ?? this.passwordVisible,
      rePasswordVisible: rePasswordVisible ?? this.rePasswordVisible,
      registerResources: registerResources ?? this.registerResources,
    );
  }
}

sealed class RegisterEvents {}

class ChangePasswordVisibilityEvent extends RegisterEvents {}

class ChangeRePasswordVisibilityEvent extends RegisterEvents {}
class NavigateToLoginEvent extends RegisterEvents {}

class SignUpEvent extends RegisterEvents {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String rePassword;

  SignUpEvent(
    this.name,
    this.email,
    this.phone,
    this.password,
    this.rePassword,
  );
}


sealed class RegistrationNavigationEvent{}
class NavigateToLogin extends RegistrationNavigationEvent{}