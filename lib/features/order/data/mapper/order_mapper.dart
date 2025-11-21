import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/order/data/datasource/models/CartResponseDto.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_product_entity.dart';

@injectable
class OrderMapper {
  CartEntity mapCartResponseToCartEntity(CartResponseDto cartResponse) {
    return CartEntity(
      cartId: cartResponse.cartId,
      ownerId: cartResponse.data?.cartOwner,
      products:
          cartResponse.data?.products
              ?.map((e) => mapProductsToCartProduct(e))
              .toList(),
      totalPrice: cartResponse.data?.totalCartPrice,
    );
  }

  CartProductEntity mapProductsToCartProduct(Products product) {

    return CartProductEntity(
      productId: product.product,
      count: product.count,
      price: product.price,
    );
  }
}
