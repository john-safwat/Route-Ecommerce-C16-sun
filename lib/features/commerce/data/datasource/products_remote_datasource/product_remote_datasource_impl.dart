import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/api/api_client.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/models/products_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/product_remote_datasource.dart';

@Injectable(as: ProductRemoteDatasource)
class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  ApiClient apiClient;

  ProductRemoteDatasourceImpl(this.apiClient);

  @override
  Future<ApiResults<List<ProductDto>>> getProduct(String category) async {
    var response = await apiClient.getProducts(category);
    return Success(data: response.productDto ?? []);
  }
}
