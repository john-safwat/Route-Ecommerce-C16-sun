import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/factory/home_section_factory.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_states.dart';

class CategoriesHomeSectionImpl
    extends HomeSectionFactory<HomeCategorySection> {
  @override
  Widget buildErrorUI(
    Resources<HomeCategorySection> data,
    Function(HomeEvents p1) doAction,
  ) {
    return CircularProgressIndicator(color: Colors.orange);
  }

  @override
  Widget buildLoadingUI(
    Resources<HomeCategorySection> data,
    Function(HomeEvents p1) doAction,
  ) {
    return CircularProgressIndicator(color: Colors.cyan);
  }

  @override
  Widget buildSuccessUI(
    Resources<HomeCategorySection> data,
    Function(HomeEvents p1) doAction,
  ) {
    return CircularProgressIndicator(color: Colors.purple);
  }
}
