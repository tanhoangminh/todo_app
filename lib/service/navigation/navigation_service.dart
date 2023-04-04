import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<dynamic> push(String routeName, {dynamic arguments});

  Future<dynamic> modalBottomPage(
    Widget page, {
    Color? backgroundColor,
    bool? enableDrag,
    bool? isDismissible,
    RouteSettings? setting,
  });
}

class NavigationServiceImpl extends NavigationService {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future push(String routeName, {arguments}) {
    if (navigatorKey.currentState == null) return Future(() => null);
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  @override
  Future modalBottomPage(
    Widget page, {
    Color? backgroundColor,
    bool? enableDrag,
    bool? isDismissible,
    RouteSettings? setting,
  }) {
    if (navigatorKey.currentState == null) return Future(() => null);
    return showMaterialModalBottomSheet(
      settings: setting,
      context: navigatorKey.currentState!.context,
      builder: (context) => page,
      duration: const Duration(milliseconds: 300),
      backgroundColor: backgroundColor ?? const Color(0xffF79E89),
      barrierColor: const Color(0xff020202).withOpacity(0.54),
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}
