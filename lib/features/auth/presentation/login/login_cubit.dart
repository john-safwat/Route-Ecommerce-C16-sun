import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base_cubit.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/auth/domain/use_cases/signin_use_case.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_states.dart';

@injectable
class LoginCubit
    extends BaseCubit<LoginStates, LoginEvents, LoginNavigationEvents> {
  SignInUseCase signInUseCase;

  LoginCubit(this.signInUseCase) : super(LoginStates());

  @override
  Future<void> doAction(LoginEvents event) async {
    switch (event) {
      case NavigateToRegisterScreenEvent():
        {
          _navigateToRegister();
        }
      case Login():
        {
          await _login(event);
        }
    }
  }

  Future<void> _login(Login event) async {
    emit(state.copyWith(loginResource: const Resources.loading()));
    var response = await signInUseCase(event.email, event.password);
    switch (response) {
      case Success<String>():
        {
          emit(
            state.copyWith(
              loginResource: Resources.success(data: response.data),
            ),
          );
          doNavigationAction(NavigateToHome());
        }
      case Fail<String>():
        {
          emit(
            state.copyWith(
              loginResource: Resources.error(exception: response.exception),
            ),
          );
          doNavigationAction(ShowErrorMessage(response.message ?? ""));
        }
    }
  }

  void _navigateToRegister() {
    doNavigationAction(NavigateToRegister());
  }
}
