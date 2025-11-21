import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';

class CategoriesTabStates {
  Resources<List<CategoryEntity>> categories;

  CategoriesTabStates({this.categories = const Resources.initial()});

  CategoriesTabStates copyWith({Resources<List<CategoryEntity>>? categories}) {
    return CategoriesTabStates(categories: categories ?? this.categories);
  }
}

sealed class CategoriesTabEvents {}
class LoadCategories extends CategoriesTabEvents {}

class OnCategoryClickEvent extends CategoriesTabEvents {
  final CategoryEntity category;

  OnCategoryClickEvent(this.category);
}

sealed class CategoriesTabNavigationEvents {}

class NavigateToProductsListScreen extends CategoriesTabNavigationEvents{
  final CategoryEntity category;

  NavigateToProductsListScreen(this.category);
}
