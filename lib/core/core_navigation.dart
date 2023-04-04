import 'package:todo_app/service/navigation/navigation_service.dart';

abstract class CoreNavigator<P> {
  NavigationService get navigation;
  void start([P? param]);
}