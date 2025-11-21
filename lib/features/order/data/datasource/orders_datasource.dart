import 'package:route_e_commerce_v2/features/order/data/datasource/models/CartResponseDto.dart';

abstract interface class OrdersDatasource {
  Future<CartResponseDto> getCart();

  Future<CartResponseDto> addToCart(String productId);
  Future<CartResponseDto> updateCartQuantity(String productId , int quantity);
  Future<CartResponseDto> removeProductFromCart(String productId);
}
