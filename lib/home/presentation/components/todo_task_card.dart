import 'package:flutter/material.dart';
import 'package:todo_app/app/font.dart';
import 'package:todo_app/app/locator.dart';
import 'package:todo_app/home/model/todo_task.dart';
import 'package:todo_app/home/presentation/navigation/home_navigation.dart';

class TodoTaskCard extends StatelessWidget {
  const TodoTaskCard({Key? key, required this.task}) : super(key: key);
  final TodoTask task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<HomeNavigation>().toTaskDetail(task);
      },
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0xffF76C6A),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(task.title, style: AppFont.mo16w600),
              const SizedBox(height: 8),
              Text(
                task.des,
                style: AppFont.mo14w400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text('Created at 1 Sept 2021', style: AppFont.mo11w400),
            ],
          ),
        ),
      ),
    );
  }
}
