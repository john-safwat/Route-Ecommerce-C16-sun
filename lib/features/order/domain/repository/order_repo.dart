import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_entity.dart';

abstract interface class OrderRepo {
  Future<ApiResults<CartEntity>> getCart();

  Future<ApiResults<CartEntity>> addToCart(String productId);

  Future<ApiResults<CartEntity>> updateCartQuantity(
    String productId,
    int quantity,
  );

  Future<ApiResults<CartEntity>> removeProductFromCart(String productId);
}
