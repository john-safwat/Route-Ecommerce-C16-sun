import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/core/network/safe_call.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/auth_response_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/remote_datasource/auth_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repository/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource remoteDataSource;
  AuthLocalDatasource localDatasource;

  AuthRepoImpl(this.remoteDataSource, this.localDatasource);

  @override
  Future<ApiResults<String>> signup(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  ) async {
    var response = await remoteDataSource.signupUser(
      name,
      email,
      phone,
      password,
      rePassword,
    );
    switch (response) {
      case Success<AuthResponseDto>():
        {
          safeCall<void>(() async {
            await localDatasource.saveToken(response.data?.token ?? '');
            return Success(data: null);
          });
          return Success(
            data: response.data?.message ?? "Account Created Successfully",
          );
        }
      case Fail<AuthResponseDto>():
        {
          return Fail(exception: response.exception, message: response.message);
        }
    }
  }

  @override
  Future<ApiResults<String>> signIn(String email, String password) async {
    var response = await remoteDataSource.signIn(email, password);
    switch (response) {
      case Success<AuthResponseDto>():
        {
          safeCall<void>(() async {
            await localDatasource.saveToken(response.data?.token ?? '');
            return Success(data: null);
          });

          getIt<Dio>().options.headers = {
            "Authorization": "Bearer ${response.data?.token ?? ''}",
          };

          return Success(data: response.data?.message);
        }
      case Fail<AuthResponseDto>():
        {
          return Fail(exception: response.exception, message: response.message);
        }
    }
  }
}
