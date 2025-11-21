import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repository/products_repo.dart';

@injectable
class GetProductsListUseCase {
  ProductsRepo repo;

  GetProductsListUseCase(this.repo);

  Future<ApiResults<List<ProductEntity>>> execute(
    String categoryIdentifier,
  ) async => repo.getProducts(categoryIdentifier);
}
