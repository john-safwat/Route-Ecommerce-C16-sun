import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/banner_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_banners_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_categories_use_case.dart';

@injectable
class GetHomeDataUseCase {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBannersUseCase getBannersUseCase;

  GetHomeDataUseCase(this.getCategoriesUseCase, this.getBannersUseCase);

  Future<List<ApiResults<HomeSection>>> getHomeData() async {
    var result = await Future.wait([
      getBannersUseCase.getBanners(),
      getCategoriesUseCase.getCategories(),
    ]);
    List<ApiResults<HomeSection>> results = [];
    for (var element in result) {
      switch (element) {
        case Success<List<Object>>():
          {
            if (result.indexOf(element) == 1) {
              var categories = element.data as List<CategoryEntity>;
              results.add(Success(data: HomeCategorySection(categories, 1)));
            } else {
              var banners = element.data as List<BannerEntity>;
              results.add(Success(data: HomeBannersSection(banners, 0)));
            }
          }
        case Fail<List<Object>>():
          {
            results.add(Fail(exception: element.exception));
            break;
          }
      }
    }
    return results;
  }
}
