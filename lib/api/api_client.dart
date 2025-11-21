import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/auth_response_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/register_request_dto.dart';
import 'package:route_e_commerce_v2/features/auth/data/datasource/models/signin_request_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/models/categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/models/products_response_dto.dart';
import 'package:route_e_commerce_v2/features/order/data/datasource/models/CartResponseDto.dart';

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

  @GET("/api/v1/products")
  Future<ProductsResponseDto> getProducts(
    @Query("category[in]") String category,
  );

  @GET("/api/v1/cart")
  Future<CartResponseDto> getCart();

  @POST("/api/v1/cart")
  Future<CartResponseDto> addProductToCart(@Body() Map<String, dynamic> body);

  @PUT("/api/v1/cart/{productId}")
  Future<CartResponseDto> updateProductToCart(
    @Path("productId") String id,
    @Body() Map<String, dynamic> body,
  );

  @PUT("/api/v1/cart/{productId}")
  Future<CartResponseDto> deleteProductToCart(@Path("productId") String id);
}
