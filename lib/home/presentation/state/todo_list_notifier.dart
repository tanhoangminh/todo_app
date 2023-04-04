import 'package:flutter/material.dart';
import 'package:todo_app/home/model/todo_task.dart';
import 'package:todo_app/home/presentation/navigation/home_navigation.dart';
import 'package:todo_app/service/cache/cache_service.dart';

class TodoListNotifier extends ChangeNotifier {
  final HomeNavigation _nav;
  final CacheService _cacheService;

  TodoListNotifier(this._nav, this._cacheService) {
    _getData();
  }

  final List<TodoTask> _tasks = [];

  List<TodoTask> get tasks => _tasks;

  void _addTask(TodoTask task) {
    _tasks.add(task);
    _cacheService.saveTask(task);
    notifyListeners();
  }

  void _getData() async {
    _tasks.clear();
    final data = await _cacheService.getListTask();
    _tasks.addAll(data);
    notifyListeners();
  }

  void _deleteTask(TodoTask task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void createTodoTask() {
    _nav.toCreateTask((task) => _addTask(task));
  }
}
