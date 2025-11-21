import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_entity.dart';

class OrdersState {
  Resources<CartEntity> cart;

  OrdersState({this.cart = const Resources.initial()});

  OrdersState copyWith({Resources<CartEntity>? cart}) {
    return OrdersState(cart: cart ?? this.cart);
  }
}

sealed class OrdersEvent {}

class GetCartEvent extends OrdersEvent {}
class AddProductToCartEvent extends OrdersEvent {
  String productId;
  AddProductToCartEvent(this.productId);
}
class RemoveProductFromCartEvent extends OrdersEvent {
  String productId;
  RemoveProductFromCartEvent(this.productId);
}
class UpdateProductQuantity extends OrdersEvent {
  String productId;
  int quantity;
  UpdateProductQuantity(this.productId, this.quantity);
}

sealed class OrdersNavigationEvent {}
