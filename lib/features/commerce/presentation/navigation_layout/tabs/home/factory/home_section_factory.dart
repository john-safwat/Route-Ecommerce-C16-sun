import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_states.dart';

abstract class HomeSectionFactory<T extends HomeSection> {
  Widget buildUI(Resources<T> data, Function(HomeEvents) doAction) {
    switch (data.status) {
      case Status.success:
        {
          return buildSuccessUI(data, doAction);
        }
      case Status.loading:
      case Status.initial:
        {
          return buildLoadingUI(data, doAction);
        }
      case Status.error:
        {
          return buildErrorUI(data, doAction);
        }
    }
  }

  Widget buildLoadingUI(Resources<T> data, Function(HomeEvents) doAction);

  Widget buildSuccessUI(Resources<T> data, Function(HomeEvents) doAction);

  Widget buildErrorUI(Resources<T> data, Function(HomeEvents) doAction);
}
