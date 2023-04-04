import 'package:get_it/get_it.dart';
import 'package:todo_app/home/presentation/navigation/home_navigation.dart';
import 'package:todo_app/home/presentation/state/todo_list_notifier.dart';
import 'package:todo_app/service/cache/cache_service.dart';
import 'package:todo_app/service/navigation/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );
  locator.registerFactory<HomeNavigation>(() => HomeNavigationImpl(locator()));
  locator.registerFactory<CacheService>(() => CacheServiceImpl());
  locator.registerFactory<TodoListNotifier>(
      () => TodoListNotifier(locator(), locator()));
  return locator.allReady();
}
