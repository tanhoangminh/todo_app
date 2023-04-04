import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/home/model/todo_task.dart';
import 'package:todo_app/service/cache/cache_service_key.dart';

abstract class CacheService {
  Future saveTask(TodoTask task);

  Future<List<TodoTask>> getListTask();
}

class CacheServiceImpl extends CacheService {
  @override
  Future saveTask(TodoTask task) async {
    final content = await read<String>(CacheServiceKey.keyTask) ?? '[]';
    final list = jsonDecode(content);
    if (list is! List) return;
    list.add(task.toJson());
    save(CacheServiceKey.keyTask, jsonEncode(list));
  }

  @override
  Future<List<TodoTask>> getListTask() async {
    final content = await read<String>(CacheServiceKey.keyTask) ?? '[]';
    final list = jsonDecode(content);
    if (list is! List) return [];
    return List<TodoTask>.from(list.map((e) => TodoTask.fromJson(e)));
  }
}

Future<T?> read<T>(String key) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dynamic value;
  final type = T.toString();
  if (type.contains('int')) {
    value = sharedPreferences.getInt(key);
  } else if (type.contains('double')) {
    value = sharedPreferences.getDouble(key);
  } else if (type.contains('bool')) {
    value = sharedPreferences.getBool(key);
  } else {
    value = sharedPreferences.getString(key);
  }
  return value;
}

Future<void> remove(String key) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove(key);
}

Future<void> save(String key, dynamic value) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  if (value is int) {
    sharedPreferences.setInt(key, value);
  } else if (value is double) {
    sharedPreferences.setDouble(key, value);
  } else if (value is bool) {
    sharedPreferences.setBool(key, value);
  } else if (value is String) {
    sharedPreferences.setString(key, value);
  } else {
    sharedPreferences.setString(key, json.encode(value));
  }
}
