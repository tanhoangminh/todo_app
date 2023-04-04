import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/locator.dart';
import 'package:todo_app/generated/assets.gen.dart';
import 'package:todo_app/home/presentation/components/todo_task_card.dart';
import 'package:todo_app/home/presentation/state/todo_list_notifier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<TodoListNotifier>(),
      child: Scaffold(
        body: const SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              _HomeAppBar(),
              _HomeHeader(),
              _HomeTodoList(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Builder(
          builder: (context) {
            final model = context.read<TodoListNotifier>();
            return _HomeFloatButton(onPressed: model.createTodoTask);
          },
        ),
      ),
    );
  }
}

class _HomeTodoList extends StatelessWidget {
  const _HomeTodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListNotifier>(
      builder: (context, model, child) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index % 2 == 0) return const SizedBox(height: 8);
                return TodoTaskCard(task: model.tasks[index ~/ 2]);
              },
              childCount: model.tasks.length * 2,
            ),
          ),
        );
      },
    );
  }
}

class _HomeFloatButton extends StatelessWidget {
  const _HomeFloatButton({Key? key, required this.onPressed}) : super(key: key);
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xffF76C6A),
      onPressed: onPressed,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Assets.icons.union.svg(),
            const SizedBox(width: 10),
            Assets.icons.listOfTodo.svg(),
            const Spacer(),
            Assets.icons.filter.svg(),
          ],
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      centerTitle: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.icons.todolist.svg(),
            Assets.icons.settings.svg(),
          ],
        ),
      ),
    );
  }
}
