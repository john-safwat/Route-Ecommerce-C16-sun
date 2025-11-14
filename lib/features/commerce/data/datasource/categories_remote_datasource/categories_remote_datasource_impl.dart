import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/api/api_client.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/categories_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/models/categories_response_dto.dart';

@Injectable(as: CategoriesRemoteDatasource)
class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource{
  ApiClient apiClient;

  CategoriesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<ApiResults<List<CategoryDto>>> getCategories() async{
    var response = await apiClient.getCategories();
    return Success(data: response.data);
  }

}