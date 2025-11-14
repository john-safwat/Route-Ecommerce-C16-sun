import 'package:json_annotation/json_annotation.dart';

part 'banners_response_dto.g.dart';

@JsonSerializable()
class BannersResponseDto {
  @JsonKey(name: "banners")
  final List<Banners>? banners;

  BannersResponseDto ({
    this.banners,
  });

  factory BannersResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BannersResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BannersResponseDtoToJson(this);
  }
}

@JsonSerializable()
class Banners {
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "categoryName")
  final String? categoryName;
  @JsonKey(name: "alignment")
  final String? alignment;
  @JsonKey(name: "buttonBackGroundColor")
  final int? buttonBackGroundColor;
  @JsonKey(name: "buttonForGroundColor")
  final int? buttonForGroundColor;

  Banners ({
    this.image,
    this.title,
    this.categoryName,
    this.alignment,
    this.buttonBackGroundColor,
    this.buttonForGroundColor,
  });

  factory Banners.fromJson(Map<String, dynamic> json) {
    return _$BannersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BannersToJson(this);
  }
}


