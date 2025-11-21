import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/factory/home_section_factory.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_states.dart';

class BannersHomeSectionImpl extends HomeSectionFactory<HomeBannersSection> {
  @override
  Widget buildErrorUI(
    Resources<HomeBannersSection> data,
    Function(HomeEvents p1) doAction,
  ) {
    return Text(data.exception.toString());
  }

  @override
  Widget buildLoadingUI(
    Resources<HomeBannersSection> data,
    Function(HomeEvents p1) doAction,
  ) {
    return CircularProgressIndicator(color: Colors.red);
  }

  @override
  Widget buildSuccessUI(
    Resources<HomeBannersSection> data,
    Function(HomeEvents p1) doAction,
  ) {
    var banners = data.data?.banner ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            itemCount: banners.length,
            itemBuilder: (context, index) => Image.asset(banners[index].image),
          ),
        ),
      ),
    );
  }
}
