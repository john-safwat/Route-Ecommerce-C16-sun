
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/banner_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';

abstract interface class HomeRepo{

  Future<ApiResults<List<BannerEntity>>> getBanners();
  Future<ApiResults<List<CategoryEntity>>> getCategory();

}