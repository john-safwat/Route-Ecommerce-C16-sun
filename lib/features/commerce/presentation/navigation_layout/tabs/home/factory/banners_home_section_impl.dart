import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/factory/home_section_factory.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_states.dart';

class BannersHomeSectionImpl extends HomeSectionFactory<HomeBannersSection>{
  @override
  Widget buildErrorUI(Resources<HomeBannersSection> data, Function(HomeEvents p1) doAction) {
        return CircularProgressIndicator(color: Colors.black);

  }

  @override
  Widget buildLoadingUI(Resources<HomeBannersSection> data, Function(HomeEvents p1) doAction) {
        return CircularProgressIndicator(color: Colors.red);

  }

  @override
  Widget buildSuccessUI(Resources<HomeBannersSection> data, Function(HomeEvents p1) doAction) {
        return CircularProgressIndicator(color: Colors.green);

  }

}