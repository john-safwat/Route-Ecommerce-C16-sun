import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/core/network/safe_call.dart';
import 'package:route_e_commerce_v2/features/order/data/datasource/orders_datasource.dart';
import 'package:route_e_commerce_v2/features/order/data/mapper/order_mapper.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/order/domain/repository/order_repo.dart';

@Injectable(as: OrderRepo)
class OrdersRepoImpl implements OrderRepo {
  OrdersDatasource datasource;
  OrderMapper mapper;

  OrdersRepoImpl(this.datasource, this.mapper);

  @override
  Future<ApiResults<CartEntity>> getCart() {
    return safeCall(() async {
      var response = await datasource.getCart();
      return Success(data: mapper.mapCartResponseToCartEntity(response));
    });
  }

  @override
  Future<ApiResults<CartEntity>> addToCart(String productId) {
    return safeCall(() async {
      var response = await datasource.addToCart(productId);
      return Success(data: mapper.mapCartResponseToCartEntity(response));
    });
  }

  @override
  Future<ApiResults<CartEntity>> removeProductFromCart(String productId) {
    return safeCall(() async {
      var response = await datasource.removeProductFromCart(productId);
      return Success(data: mapper.mapCartResponseToCartEntity(response));
    });
  }

  @override
  Future<ApiResults<CartEntity>> updateCartQuantity(
    String productId,
    int quantity,
  ) {
    return safeCall(() async {
      var response = await datasource.updateCartQuantity(productId, quantity);
      return Success(data: mapper.mapCartResponseToCartEntity(response));
    });
  }
}
