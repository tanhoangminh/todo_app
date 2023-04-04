import 'package:flutter/material.dart';
import 'package:todo_app/app/font.dart';
import 'package:todo_app/generated/assets.gen.dart';
import 'package:todo_app/home/model/todo_task.dart';

class TodoTaskDetailPage extends StatelessWidget {
  const TodoTaskDetailPage({Key? key, required this.task}) : super(key: key);
  final TodoTask task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          Assets.icons.clock.svg(),
          const SizedBox(width: 8),
          Assets.icons.edit.svg(),
          const SizedBox(width: 8),
          Assets.icons.trash.svg(),
          const SizedBox(width: 16.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              task.title.toUpperCase(),
              style: AppFont.be26w400.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 26),
            Text(
              task.des,
              style: AppFont.mo16w400.copyWith(color: Colors.black),
            ),
            const Spacer(),
            Text(
              'Created at 1 Sept 2021',
              textAlign: TextAlign.center,
              style: AppFont.mo14w400.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
