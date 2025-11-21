import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base_cubit.dart';
import 'package:route_e_commerce_v2/core/network/Resources.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/home_section.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_home_data_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_states.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState, HomeEvents, HomeNavigationEvent> {
  GetHomeDataUseCase getHomeDataUseCase;

  HomeCubit(this.getHomeDataUseCase) : super(HomeState());

  @override
  Future<void> doAction(HomeEvents event) async {
    switch (event) {
      case LoadData():
        {
          _loadData();
          break;
        }
    }
  }

  Future<void> _loadData() async {
    emit(
      state.copyWith(
        homeData: [
          Resources<HomeBannersSection>.loading(
            data: HomeBannersSection([], 0),
          ),
          Resources<HomeCategorySection>.loading(
            data: HomeCategorySection([], 1),
          ),
        ],
      ),
    );
    var response = await getHomeDataUseCase.getHomeData();
    List<Resources<HomeSection>> homeSections = [];
    for (var section in response) {
      switch (section) {
        case Success<HomeSection>():
          {
            switch (section.data) {
              case null:
                homeSections.add(Resources.success(data: section.data));
              case HomeBannersSection():
                homeSections.add(
                  Resources.success(data: section.data as HomeBannersSection),
                );
              case HomeCategorySection():
                homeSections.add(
                  Resources.success(data: section.data as HomeCategorySection),
                );
            }
          }
        case Fail<HomeSection>():
          {
            homeSections.add(Resources.error(exception: section.exception));
          }
      }
    }
    print(homeSections);
    emit(state.copyWith(homeData: homeSections));
  }
}
