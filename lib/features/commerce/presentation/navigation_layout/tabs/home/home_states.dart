import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';

class HomeState {
  List<Resources<HomeSection>> homeData;

  HomeState({this.homeData = const [Resources.initial(), Resources.initial()]});

  HomeState copyWith({List<Resources<HomeSection>>? homeData}) {
    return HomeState(homeData: homeData ?? this.homeData);
  }
}

sealed class HomeEvents {}
class LoadData extends HomeEvents {}

sealed class HomeNavigationEvent{}

