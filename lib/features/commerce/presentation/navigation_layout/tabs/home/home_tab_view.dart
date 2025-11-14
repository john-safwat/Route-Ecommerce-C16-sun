import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/factory/banners_home_section_impl.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/factory/categories_home_section_impl.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_states.dart';

import '../../../../../../core/di/di.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeCubit cubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.doAction(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.homeData.length,
            separatorBuilder: (_, _) => 16.spaceVertical,
            itemBuilder: (_, index) {
              return switch (state.homeData[index].data) {
                null => const SizedBox(),
                HomeBannersSection() => BannersHomeSectionImpl().buildUI(
                  state.homeData[index] as Resources<HomeBannersSection>,
                  cubit.doAction,
                ),
                HomeCategorySection() => CategoriesHomeSectionImpl().buildUI(
                  state.homeData[index] as Resources<HomeCategorySection>,
                  cubit.doAction,
                ),
              };
            },
          );
        },
      ),
    );
  }
}
