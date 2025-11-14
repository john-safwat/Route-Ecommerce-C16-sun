import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network/api_results.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/banners_local_datasource/banners_local_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/banners_local_datasource/models/banners_response_dto.dart';


@Injectable(as: BannersLocalDatasource)
class BannersLocalDatasourceImpl implements BannersLocalDatasource{

  AssetBundle assetBundle;

  BannersLocalDatasourceImpl(this.assetBundle);

  @override
  Future<ApiResults<List<Banners>>> getBannersList() async {
    var response = await assetBundle.loadString("assets/files/home_banners.json");
    var decodedResponse = jsonDecode(response);
    var dataResponse = BannersResponseDto.fromJson(decodedResponse);
    return Success(data: dataResponse.banners);
  }
}
