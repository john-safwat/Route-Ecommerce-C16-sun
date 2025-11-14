import 'package:flutter/material.dart';

class BannerEntity {
  final String image;
  final String title;
  final String categoryName;
  final Alignment alignment;
  final Color buttonBackGroundColor;
  final Color buttonForGroundColor;

  BannerEntity({
    required this.image,
    required this.title,
    required this.categoryName,
    required this.alignment,
    required this.buttonBackGroundColor,
    required this.buttonForGroundColor,
  });
}
