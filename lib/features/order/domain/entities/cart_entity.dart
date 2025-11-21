import 'package:route_e_commerce_v2/features/order/domain/entities/cart_product_entity.dart';

class CartEntity {
  final String? cartId;
  final String? ownerId;
  final List<CartProductEntity>? products;
  final num? totalPrice;

  CartEntity({this.cartId, this.ownerId, this.products, this.totalPrice});
}
