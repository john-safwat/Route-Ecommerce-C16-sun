import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/login_states.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  Future<void> doIntent(LoginEvents event) async {
    switch (event) {
      case NavigateToRegisterScreenEvent():
        {
          _navigateToRegister();
        }
    }
  }

  void _navigateToRegister() {
    emit(state.copyWith(navigateToRegister: true));
  }
}
