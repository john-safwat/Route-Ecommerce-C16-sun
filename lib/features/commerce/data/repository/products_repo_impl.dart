import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/core/network/safe_call.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/models/products_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/product_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/mappers/products_mapper.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repository/products_repo.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProductRemoteDatasource remoteDatasource;
  ProductsMapper mapper;

  ProductsRepoImpl(this.remoteDatasource, this.mapper);

  @override
  Future<ApiResults<List<ProductEntity>>> getProducts(String category) async =>
      safeCall(() async {
        var response = await remoteDatasource.getProduct(category);
        switch (response) {
          case Success<List<ProductDto>>():
            {
              return Success(
                data:
                    response.data
                        ?.map((e) => mapper.mapProductDtoToEntity(e))
                        .toList(),
              );
            }
          case Fail<List<ProductDto>>():
            return Fail(exception: response.exception);
        }
      });
}
