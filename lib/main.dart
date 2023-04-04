import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/config/app_size.dart';
import 'package:todo_app/service/navigation/navigation_service.dart';
import 'package:todo_app/service/navigation/router.dart';

import 'app/locator.dart';
import 'app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///setup DI
  await setupLocator();

  /// này để chặn user quay điện thoại
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterPage.generateRoute,
      builder: (context, child) {
        final data = MediaQuery.of(context).copyWith(textScaleFactor: 1);
        AppSize.init(context);
        return MediaQuery(data: data, child: child!);
      },
    );
  }
}
