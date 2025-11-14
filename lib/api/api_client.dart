import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/auth_response_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/register_request_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/signin_request_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/models/categories_response_dto.dart';

part 'api_client.g.dart';

@singleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/api/v1/auth/signup")
  Future<AuthResponseDto> signup(@Body() RegisterRequestDto registerRequest);

  @POST("/api/v1/auth/signin")
  Future<AuthResponseDto> signIn(@Body() SignInRequestDto signInRequest);

  @GET("/api/v1/categories")
  Future<CategoriesResponseDto> getCategories();
}
