import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repo.dart';

@injectable
class SignupUseCase {
  AuthRepo repo;

  SignupUseCase(this.repo);

  Future<ApiResults<String>> call(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  ) => repo.signup(name, email, phone, password, rePassword);
}
