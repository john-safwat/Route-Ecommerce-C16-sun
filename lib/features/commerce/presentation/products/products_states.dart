import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';

class ProductsStates {
  Resources<List<ProductEntity>> products;

  ProductsStates({this.products = const Resources.initial()});

  ProductsStates copyWith({Resources<List<ProductEntity>>? products}) {
    return ProductsStates(products: products ?? this.products);
  }
}

sealed class ProductsEvents {}

class LoadProductsData extends ProductsEvents {
  CategoryEntity categoryEntity;

  LoadProductsData(this.categoryEntity);
}
