import 'package:flutter/material.dart';
import 'package:todo_app/home/model/todo_task.dart';
import 'package:todo_app/home/presentation/page/home_screen.dart';
import 'package:todo_app/home/presentation/page/todo_task_detail_screen.dart';
import 'package:todo_app/service/navigation/router_path.dart';

mixin RouterPage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.home:
        return _routeToPage(
          page: const HomeScreen(),
          settings: settings,
        );
      case RouterPath.todoTaskDetail:
        final task = settings.arguments as TodoTask;
        return _routeToPage(
          page: TodoTaskDetailPage(task: task),
          settings: settings,
        );
      default:
        return _routeToPage(
          page: const HomeScreen(),
          settings: settings,
        );
    }
  }

  static MaterialPageRoute<dynamic> _routeToPage({
    required Widget page,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(settings: settings, builder: (_) => page);
  }
}
