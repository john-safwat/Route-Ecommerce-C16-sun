import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_states.dart';
import 'package:route_e_commerce_v2/features/order/domain/entities/cart_product_entity.dart';
import 'package:route_e_commerce_v2/features/order/presentation/order/orders_contract.dart';
import 'package:route_e_commerce_v2/features/order/presentation/order/orders_cubit.dart';

class ProductCard extends StatefulWidget {
  final ProductEntity product;
  final Function(ProductsEvents) navigateTpProductDetails;

  ProductCard({
    required this.product,
    required this.navigateTpProductDetails,
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final OrdersCubit cubit = getIt();
  CartProductEntity? cartProductEntity;

  @override
  void initState() {
    super.initState();
    if (cubit.state.cart.status == Status.success) {
      var items  = cubit.state.cart.data?.products?.where(
        (e) => e.productId == widget.product.id,
      );
      if((items??[]).isNotEmpty && items != null){

        cartProductEntity = items.first;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.blue),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: cartProductEntity != null ? Alignment.bottomRight : Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    widget.product.imageCover ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        cartProductEntity != null
                            ? [
                              IconButton(
                                onPressed: () {
                                  // todo add function
                                },
                                icon: const Icon(Icons.remove),
                                color: AppColors.white,
                              ),
                              Text((cartProductEntity?.count??0).toString()),
                              IconButton(
                                onPressed: () {
                                  // todo add function
                                },
                                icon: const Icon(Icons.add),
                                color: AppColors.white,
                              ),
                            ]
                            : [
                              IconButton(
                                onPressed: () {
                                  cubit.doAction(AddProductToCartEvent(widget.product.id??""));
                                },
                                icon: const Icon(Icons.add),
                                color: AppColors.white,
                              ),
                            ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "${widget.product.title ?? ""}\n",
                  maxLines: 2,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.blue),
                ),
                Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "${widget.product.priceAfterDiscount ?? widget.product.price ?? 0.0} ",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: AppColors.blue),
                      ),
                      if (widget.product.priceAfterDiscount != null)
                        TextSpan(
                          text: (widget.product.price ?? 0).toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Review(${widget.product.ratingsAverage ?? 0})",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: AppColors.grey),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // todo add Favorite functions
                      },
                      child: const Icon(Icons.favorite, color: AppColors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
