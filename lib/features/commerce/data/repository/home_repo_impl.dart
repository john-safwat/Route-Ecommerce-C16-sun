import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/core/network/safe_call.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/banners_local_datasource/banners_local_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/banners_local_datasource/models/banners_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/categories_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/models/categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/mappers/home_mapper.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/banner_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';

import '../../domain/repository/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  BannersLocalDatasource bannersLocalDatasource;
  CategoriesRemoteDatasource categoriesRemoteDatasource;
  HomeMapper homeMapper;

  HomeRepoImpl(
    this.bannersLocalDatasource,
    this.homeMapper,
    this.categoriesRemoteDatasource,
  );

  @override
  Future<ApiResults<List<BannerEntity>>> getBanners() => safeCall(() async {
    var response = await bannersLocalDatasource.getBannersList();
    return switch (response) {
      Success<List<Banners>>() => Success(
        data: homeMapper.mapBannersList(response.data ?? []),
      ),
      Fail<List<Banners>>() => Fail(exception: response.exception),
    };
  });

  @override
  Future<ApiResults<List<CategoryEntity>>> getCategory() => safeCall(() async {
    var response = await categoriesRemoteDatasource.getCategories();
    return switch (response) {
      Success<List<CategoryDto>>() => Success(
        data: homeMapper.mapCategoriesList(response.data),
      ),

      Fail<List<CategoryDto>>() => Fail(exception: response.exception),
    };
  });
}
