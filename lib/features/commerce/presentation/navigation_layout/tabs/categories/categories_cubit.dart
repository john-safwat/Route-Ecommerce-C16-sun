import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base_cubit.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_states.dart';

@injectable
class CategoriesCubit
    extends
        BaseCubit<
          CategoriesTabStates,
          CategoriesTabEvents,
          CategoriesTabNavigationEvents
        > {
  GetCategoriesUseCase getCategoriesUseCase;

  CategoriesCubit(this.getCategoriesUseCase) : super(CategoriesTabStates());

  @override
  Future<void> doAction(CategoriesTabEvents event) async {
    switch (event) {
      case LoadCategories():
        {
          await _loadCategories();
        }
      case OnCategoryClickEvent():{
        _navigateToProductsListScreen(event);
      }
    }
  }

  void _navigateToProductsListScreen(OnCategoryClickEvent event) {
    doNavigationAction(NavigateToProductsListScreen(event.category));
  }

  Future<void> _loadCategories() async {
    emit(state.copyWith(categories: const Resources.loading()));
    var categories = await getCategoriesUseCase.getCategories();
    switch (categories) {
      case Success<List<CategoryEntity>>():
        {
          emit(
            state.copyWith(
              categories: Resources.success(data: categories.data),
            ),
          );
        }
      case Fail<List<CategoryEntity>>():
        {
          emit(
            state.copyWith(
              categories: Resources.error(
                exception: categories.exception,
              ),
            ),
          );
        }
    }
  }
}
