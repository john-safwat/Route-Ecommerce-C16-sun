import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/api/api_client.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/core/network/app_errors.dart';
import 'package:route_e_commerce_v2/core/network/safe_call.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/auth_response_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/register_request_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/signin_request_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/remote_datasource/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<ApiResults<AuthResponseDto>> signupUser(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  ) async {
    return safeCall(() async {
      var response = await client.signup(
        RegisterRequestDto(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
        ),
      );
      if ((response.message ?? "").contains("Account Already Exists")) {
        return Fail(exception: EmailAlreadyExist(), message: response.message);
      }
      return Success(data: response);
    });
  }

  @override
  Future<ApiResults<AuthResponseDto>> signIn(String email, String password) =>
      safeCall(() async {
        var response = await client.signIn(
          SignInRequestDto(email: email, password: password),
        );
        if ((response.message ?? "").contains('Incorrect email or password')) {
          return Fail(
            exception: InvalidUserCredentials(),
            message: response.message,
          );
        }
        return Success(data: response);
      });
}
