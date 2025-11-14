import 'package:route_e_commerce_v2/features/commerce/domain/entity/banner_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';

sealed class HomeSection {
  int index;
  HomeSection(this.index);
}

class HomeBannersSection extends HomeSection {
  List<BannerEntity> banner;
  HomeBannersSection(this.banner, super.index);
}

class HomeCategorySection extends HomeSection {
  List<CategoryEntity> categories;
  HomeCategorySection(this.categories, super.index);
}
