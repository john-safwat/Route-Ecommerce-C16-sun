
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/banners_local_datasource/models/banners_response_dto.dart';

abstract interface class BannersLocalDatasource{

  Future<ApiResults<List<Banners>>> getBannersList();

}