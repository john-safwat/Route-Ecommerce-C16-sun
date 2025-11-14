import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/models/categories_response_dto.dart';

abstract interface class CategoriesRemoteDatasource {
  Future<ApiResults<List<CategoryDto>>> getCategories();
}
