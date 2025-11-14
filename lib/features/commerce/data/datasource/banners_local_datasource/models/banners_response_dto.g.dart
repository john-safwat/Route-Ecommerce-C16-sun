// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponseDto _$BannersResponseDtoFromJson(Map<String, dynamic> json) =>
    BannersResponseDto(
      banners:
          (json['banners'] as List<dynamic>?)
              ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BannersResponseDtoToJson(BannersResponseDto instance) =>
    <String, dynamic>{'banners': instance.banners};

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
  image: json['image'] as String?,
  title: json['title'] as String?,
  categoryName: json['categoryName'] as String?,
  alignment: json['alignment'] as String?,
  buttonBackGroundColor: (json['buttonBackGroundColor'] as num?)?.toInt(),
  buttonForGroundColor: (json['buttonForGroundColor'] as num?)?.toInt(),
);

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
  'image': instance.image,
  'title': instance.title,
  'categoryName': instance.categoryName,
  'alignment': instance.alignment,
  'buttonBackGroundColor': instance.buttonBackGroundColor,
  'buttonForGroundColor': instance.buttonForGroundColor,
};
