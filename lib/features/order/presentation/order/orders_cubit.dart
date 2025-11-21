import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base_cubit.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/order/domain/repository/order_repo.dart';
import 'package:route_e_commerce_v2/features/order/presentation/order/orders_contract.dart';

@singleton
class OrdersCubit
    extends BaseCubit<OrdersState, OrdersEvent, OrdersNavigationEvent> {
  OrderRepo orderRepo;

  OrdersCubit(this.orderRepo) : super(OrdersState());

  @override
  Future<void> doAction(OrdersEvent event) async {
    switch (event) {
      case GetCartEvent():
        {
          await _getUserCart();
        }
      case AddProductToCartEvent():
        {
          _addProductToCart(event.productId);
        }
      case RemoveProductFromCartEvent():
        {
          _removeProductToCart(event.productId);
        }
      case UpdateProductQuantity():
        {
          _updateProductToCart(event.productId, event.quantity);
        }
    }
  }

  Future<void> _getUserCart() async {
    emit(state.copyWith(cart: const Resources.loading()));
    var response = await orderRepo.getCart();
    switch (response) {
      case Success<CartEntity>():
        {
          emit(state.copyWith(cart: Resources.success(data: response.data)));
        }
      case Fail<CartEntity>():
        {
          emit(state.copyWith(cart: const Resources.error()));
        }
    }
  }

  Future<void> _addProductToCart(String productId) async {
    emit(state.copyWith(cart: const Resources.loading()));
    var response = await orderRepo.addToCart(productId);
    switch (response) {
      case Success<CartEntity>():
        {
          emit(state.copyWith(cart: Resources.success(data: response.data)));
          _getUserCart();
        }
      case Fail<CartEntity>():
        {
          emit(state.copyWith(cart: const Resources.error()));
        }
    }
  }

  Future<void> _removeProductToCart(String productId) async {
    emit(state.copyWith(cart: const Resources.loading()));
    var response = await orderRepo.removeProductFromCart(productId);
    switch (response) {
      case Success<CartEntity>():
        {
          emit(state.copyWith(cart: Resources.success(data: response.data)));
        }
      case Fail<CartEntity>():
        {
          emit(state.copyWith(cart: const Resources.error()));
        }
    }
  }

  Future<void> _updateProductToCart(String productId, int count) async {
    emit(state.copyWith(cart: const Resources.loading()));
    var response = await orderRepo.updateCartQuantity(productId, count);
    switch (response) {
      case Success<CartEntity>():
        {
          emit(state.copyWith(cart: Resources.success(data: response.data)));
        }
      case Fail<CartEntity>():
        {
          emit(state.copyWith(cart: const Resources.error()));
        }
    }
  }
}
