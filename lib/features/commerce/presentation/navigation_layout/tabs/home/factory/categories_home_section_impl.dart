import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/white_space.dart';
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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: TextStyle(color: AppColors.blue)),
              Text("viewAll", style: TextStyle(color: AppColors.blue)),
            ],
          ),
        ),
        16.spaceVertical,
        SizedBox(
          height: 200,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: data.data?.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.network(
                          data.data?.categories[index].image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ],
    );
  }
}
