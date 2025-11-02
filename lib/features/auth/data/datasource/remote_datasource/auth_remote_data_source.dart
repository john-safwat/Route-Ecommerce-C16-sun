import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/auth_response_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResults<AuthResponseDto>> signupUser(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  );

  Future<ApiResults<AuthResponseDto>> signIn(String email, String password);
}
