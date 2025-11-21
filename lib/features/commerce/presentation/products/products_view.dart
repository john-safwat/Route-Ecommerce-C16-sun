import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/category_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_states.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/widgets/product_card.dart';

class ProductsView extends StatefulWidget {
  final CategoryEntity category;

  const ProductsView({required this.category, super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  ProductsCubit cubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.doAction(LoadProductsData(widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.category.name)),
        body: BlocBuilder<ProductsCubit, ProductsStates>(
          builder: (context, state) {
            var productResources = state.products;
            switch (state.products.status) {
              case Status.success:
                {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                    itemBuilder:
                        (_, index) => ProductCard(
                          product: productResources.data![index],
                          navigateTpProductDetails: cubit.doAction,
                        ),
                    itemCount: productResources.data?.length ?? 0,
                  );
                }
              case Status.loading:
              case Status.initial:
                {
                  return const Center(child: CircularProgressIndicator());
                }
              case Status.error:
                {
                  return Center(
                    child: Column(
                      children: [
                        Text(productResources.exception.toString()),
                        8.spaceVertical,
                        FilledButton(
                          onPressed: () {
                            cubit.doAction(LoadProductsData(widget.category));
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
