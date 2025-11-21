import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/routing/app_router.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_states.dart';

class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  CategoriesCubit categoriesCubit = getIt();

  @override
  void initState() {
    super.initState();
    categoriesCubit.doAction(LoadCategories());
    categoriesCubit.navigationStream.listen((event){
      switch (event) {
        case NavigateToProductsListScreen():{
          Navigator.pushNamed(context, Routes.productsRoute , arguments: event.category);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: categoriesCubit,
      child: BlocBuilder<CategoriesCubit, CategoriesTabStates>(
        builder: (context, state) {
          switch (state.categories.status) {
            case Status.success:
              {
                var categories = state.categories.data ?? [];

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder:
                      (_, index) => InkWell(
                        onTap: (){
                          categoriesCubit.doAction(OnCategoryClickEvent(categories[index]));
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2000),
                                    child: Image.network(categories[index].image, fit: BoxFit.cover,)),
                              ),
                            ),
                            8.spaceVertical,
                            Text(
                              categories[index].name,
                              style: const TextStyle(
                                color: AppColors.blue,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                  itemCount: categories.length,
                );
              }
            case Status.loading:
            case Status.initial:
              {
                return Center(child: const CircularProgressIndicator());
              }
            case Status.error:
              {
                return Text(state.categories.exception.toString());
              }
          }
        },
      ),
    );
  }
}
