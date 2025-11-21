import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';

abstract interface class ProductsRepo {
  Future<ApiResults<List<ProductEntity>>> getProducts(String category);
}
