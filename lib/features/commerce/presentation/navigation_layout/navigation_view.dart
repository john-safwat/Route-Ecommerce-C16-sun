import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
  import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/favorite/favorite_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/profile/profile_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/widgets/home_bottom_navigation_bar_item.dart';
import 'package:route_e_commerce_v2/features/order/presentation/order/orders_contract.dart';
import 'package:route_e_commerce_v2/features/order/presentation/order/orders_cubit.dart';
class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  ValueNotifier<int> index = ValueNotifier(0);
  OrdersCubit ordersCubit = getIt();

  @override
  void initState() {
    super.initState();
    ordersCubit.doAction(GetCartEvent());
  }

  List<Widget> pages = [
    const HomeTabView(),
    const CategoriesTabView(),
    const FavoriteTabView(),
    const ProfileTabView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder:
          (context, value, child) => Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                          ),
                        )),
                        16.spaceHorizontal,
                        const Icon(Icons.shopping_cart_rounded , color: AppColors.blue, size: 40,)
                      ],
                    ),
                  ),
                  Expanded(child: pages[value]),
                ],
              ),
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.blue,
                type: BottomNavigationBarType.fixed,
                onTap: changeSelectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.home_outline,
                    isSelected: value == 0,
                  ),
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.category_outline,
                    isSelected: value == 1,
                  ),
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.heart_outline,
                    isSelected: value == 2,
                  ),
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.user_outline,
                    isSelected: value == 3,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void changeSelectedIndex(int value) {
    if (value == index.value) return;
    index.value = value;
  }
}
