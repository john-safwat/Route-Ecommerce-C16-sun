import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repo.dart';

@injectable
class SignInUseCase {
  AuthRepo repo;

  SignInUseCase(this.repo);

  Future<ApiResults<String>> call(String email, String password) =>
      repo.signIn(email, password);
}
