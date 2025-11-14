import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/banner_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repository/home_repo.dart';

@injectable
class GetBannersUseCase {
  HomeRepo repo;

  GetBannersUseCase(this.repo);

  Future<ApiResults<List<BannerEntity>>> getBanners() {
    return repo.getBanners();
  }
}
