import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/models/products_response_dto.dart';

abstract interface class ProductRemoteDatasource{

  Future<ApiResults<List<ProductDto>>> getProduct(String category);

}