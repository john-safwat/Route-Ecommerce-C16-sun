import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base_cubit.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_state.dart';

@injectable
class RegisterCubit extends BaseCubit<RegisterState , RegisterEvents , RegistrationNavigationEvent> {
  SignupUseCase signupUseCase;
  RegisterCubit(this.signupUseCase) : super(RegisterState());



  @override
  Future<void> doAction(RegisterEvents event) async {
    switch (event) {
      case ChangePasswordVisibilityEvent():
        {
          _changePasswordVisible();
        }
      case ChangeRePasswordVisibilityEvent():
        {
          _changeRePasswordVisible();
        }
      case SignUpEvent():
        {
          await _register(event);
        }
      case NavigateToLoginEvent():
        {
          _navigateToLogin();
        }
    }
  }

  void _navigateToLogin() {
    doNavigationAction(NavigateToLogin());
  }

  Future<void> _register(SignUpEvent event) async {
    emit(state.copyWith(registerResources: const Resources.loading()));
    var response = await signupUseCase(
      event.name,
      event.email,
      event.phone,
      event.password,
      event.rePassword,
    );
    switch (response) {
      case Success<String>():
        {
          emit(
            state.copyWith(
              registerResources: Resources.success(data: response.data),
            ),
          );
          doNavigationAction(NavigateToLogin());
        }
      case Fail<String>():
        {
          emit(
            state.copyWith(
              registerResources: Resources.error(exception: response.exception),
            ),
          );
        }
    }
  }

  void _changeRePasswordVisible() {
    emit(state.copyWith(rePasswordVisible: !state.rePasswordVisible));
  }

  void _changePasswordVisible() {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }
}
