import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/font.dart';
import 'package:todo_app/home/model/todo_task.dart';
import 'package:todo_app/widget/app_input.dart';
import 'package:todo_app/widget/app_text_focus.dart';

class TodoCreateTaskSheet extends StatefulWidget {
  const TodoCreateTaskSheet({
    Key? key,
    required this.onTaskChanged,
  }) : super(key: key);
  final Function(TodoTask task) onTaskChanged;

  @override
  State<TodoCreateTaskSheet> createState() => _TodoCreateTaskSheetState();
}

class _TodoCreateTaskSheetState extends State<TodoCreateTaskSheet> {
  String title = '';
  String des = '';

  bool get isActive => title.isNotEmpty || des.isNotEmpty;

  void _onTitleChanged(String value) {
    if (title == value) return;
    setState(() {
      title = value;
    });
  }

  void _onDesChanged(String value) {
    if (des == value) return;
    setState(() {
      des = value;
    });
  }

  void _handleSubmit() {
    final TodoTask task = TodoTask(title: title, des: des);
    Navigator.of(context).pop();
    widget.onTaskChanged.call(task);
  }

  @override
  Widget build(BuildContext context) {
    return AppFocusScope(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const _HeaderSheet(),
              const SizedBox(height: 12),
              AppTextField(
                autoFocus: true,
                placeHolder: 'Title',
                onChanged: _onTitleChanged,
              ),
              const SizedBox(height: 16),
              AppTextField(
                placeHolder: 'Description',
                maxLines: 10,
                onChanged: _onDesChanged,
              ),
              const SizedBox(height: 16),
              _ButtonSheet(onSubmit: _handleSubmit, isActive: isActive),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonSheet extends StatelessWidget {
  const _ButtonSheet({
    Key? key,
    required this.isActive,
    required this.onSubmit,
  }) : super(key: key);
  final bool isActive;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isActive) return;
        onSubmit.call();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(48.0),
        backgroundColor:
            isActive ? Colors.white : Colors.white.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        'ADD TODO',
        style: AppFont.mo14w500.copyWith(
          color: const Color(0xffF79E89),
        ),
      ),
    );
  }
}

class _HeaderSheet extends StatelessWidget {
  const _HeaderSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 6,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}
