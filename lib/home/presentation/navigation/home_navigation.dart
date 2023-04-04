import 'package:todo_app/core/core_navigation.dart';
import 'package:todo_app/home/model/todo_task.dart';
import 'package:todo_app/home/presentation/components/todo_create_task_sheet.dart';
import 'package:todo_app/service/navigation/navigation_service.dart';
import 'package:todo_app/service/navigation/router_path.dart';

abstract class HomeNavigation implements CoreNavigator {
  void toCreateTask(Function(TodoTask task) onTaskChanged);

  void toTaskDetail(TodoTask task);
}

class HomeNavigationImpl extends HomeNavigation {
  final NavigationService nav;

  HomeNavigationImpl(this.nav);

  @override
  NavigationService get navigation => nav;

  @override
  void start([param]) {
    nav.push(RouterPath.home);
  }

  @override
  void toCreateTask(Function(TodoTask task) onTaskChanged) {
    nav.modalBottomPage(TodoCreateTaskSheet(onTaskChanged: onTaskChanged));
  }

  @override
  void toTaskDetail(TodoTask task) {
    nav.push(RouterPath.todoTaskDetail, arguments: task);
  }
}
