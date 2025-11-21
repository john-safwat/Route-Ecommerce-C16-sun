import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
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
                null => const CircularProgressIndicator(),
                HomeBannersSection() => BannersHomeSectionImpl().buildUI(
                  switch (state.homeData[index].status) {
                    Status.success => Resources<HomeBannersSection>.success(
                      data: state.homeData[index].data as HomeBannersSection,
                    ),
                    Status.loading =>
                      const Resources<HomeBannersSection>.loading(),
                    Status.initial =>
                      const Resources<HomeBannersSection>.initial(),
                    Status.error => Resources<HomeBannersSection>.error(
                      exception: state.homeData[index].exception,
                    ),
                  },
                  cubit.doAction,
                ),
                HomeCategorySection() => CategoriesHomeSectionImpl().buildUI(
                  switch (state.homeData[index].status) {
                    Status.success => Resources<HomeCategorySection>.success(
                      data: state.homeData[index].data as HomeCategorySection,
                    ),
                    Status.loading =>
                      const Resources<HomeCategorySection>.loading(),
                    Status.initial =>
                      const Resources<HomeCategorySection>.initial(),
                    Status.error => Resources<HomeCategorySection>.error(
                      exception: state.homeData[index].exception,
                    ),
                  },
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
