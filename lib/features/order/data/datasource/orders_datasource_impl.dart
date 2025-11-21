import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/api/api_client.dart';
import 'package:route_e_commerce_v2/features/order/data/datasource/models/CartResponseDto.dart';
import 'package:route_e_commerce_v2/features/order/data/datasource/orders_datasource.dart';

@Injectable(as: OrdersDatasource)
class OrdersDatasourceImpl implements OrdersDatasource {
  ApiClient apiClient;

  OrdersDatasourceImpl(this.apiClient);

  @override
  Future<CartResponseDto> getCart() async {
    return apiClient.getCart();
  }

  @override
  Future<CartResponseDto> addToCart(String productId) {
    return apiClient.addProductToCart({"productId": productId});
  }

  @override
  Future<CartResponseDto> removeProductFromCart(String productId) {
    return apiClient.deleteProductToCart(productId);
  }

  @override
  Future<CartResponseDto> updateCartQuantity(String productId, int quantity) {
    return apiClient.updateProductToCart(productId, {
      "count": quantity.toString(),
    });
  }
}
