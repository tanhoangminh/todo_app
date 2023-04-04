import 'package:flutter/material.dart';

mixin AppSize {
  static const heightRatio = 812;
  static const widthRatio = 375;

  static late double screenWidth;
  static late double screenHeight;

  /// Width Padding
  static late double horizontalPadding;

  /// Height Padding
  static late double verticalPadding;

  static late double safeTopPadding;

  static void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    horizontalPadding = screenWidth * 16 / widthRatio;
    verticalPadding = screenHeight * 16 / heightRatio;
    safeTopPadding = MediaQuery.of(context).padding.top;
  }
}
