import 'package:flutter/material.dart' show Alignment, Color;
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/banners_local_datasource/models/banners_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/banner_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/categories_remote_datasource/models/categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';

@injectable
class HomeMapper {
  List<BannerEntity> mapBannersList(List<Banners?> banners) {
    List<BannerEntity> bannerEntities = [];
    for (var banner in banners) {
      bannerEntities.add(_mapBannerToBannerEntity(banner));
    }
    return bannerEntities;
  }

  BannerEntity _mapBannerToBannerEntity(Banners? banner) {
    return BannerEntity(
      image: banner?.image ?? "",
      title: banner?.title ?? "",
      categoryName: banner?.categoryName ?? "",
      alignment:
          (banner?.alignment ?? "start") == "start"
              ? Alignment.centerLeft
              : Alignment.centerRight,
      buttonBackGroundColor: Color(banner?.buttonBackGroundColor ?? 0),
      buttonForGroundColor: Color(banner?.buttonForGroundColor ?? 0),
    );
  }

  /// Map from the response wrapper to a list of [CategoryEntity].
  List<CategoryEntity> mapCategoriesFromResponse(CategoriesResponseDto? response) {
    return mapCategoriesList(response?.data);
  }

  /// Map a nullable list of [CategoryDto] to a list of [CategoryEntity].
  List<CategoryEntity> mapCategoriesList(List<CategoryDto?>? categories) {
    final List<CategoryEntity> categoryEntities = [];
    if (categories == null) return categoryEntities;
    for (var cat in categories) {
      categoryEntities.add(mapCategoryDtoToEntity(cat));
    }
    return categoryEntities;
  }

  /// Map a single [CategoryDto] to [CategoryEntity].
  CategoryEntity mapCategoryDtoToEntity(CategoryDto? dto) {
    return CategoryEntity(
      dto?.Id ?? '',
      dto?.name ?? '',
      dto?.image ?? '',
    );
  }
}
