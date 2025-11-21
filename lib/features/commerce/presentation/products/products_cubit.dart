import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base_cubit.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_products_list_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_states.dart';

@injectable
class ProductsCubit extends BaseCubit<ProductsStates, ProductsEvents, void> {
  GetProductsListUseCase getProductsListUseCase;

  ProductsCubit(this.getProductsListUseCase) : super(ProductsStates());

  @override
  Future<void> doAction(ProductsEvents event) async {
    switch (event) {
      case LoadProductsData():
        {
          emit(state.copyWith(products: const Resources.loading()));

          var response = await getProductsListUseCase.execute(
            event.categoryEntity.id,
          );

          switch (response) {
            case Success<List<ProductEntity>>():
              {
                emit(
                  state.copyWith(
                    products: Resources.success(data: response.data),
                  ),
                );
              }
            case Fail<List<ProductEntity>>():
              {
                emit(
                  state.copyWith(
                    products: Resources.error(exception: response.exception),
                  ),
                );
              }
          }
        }
    }
  }
}
