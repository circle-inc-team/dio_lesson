import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';
import '../provider/todos_provider.dart';
import '../widget/create_todo_area.dart';
import '../widget/todo_item.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  Future<void> setup() async {
    ref.read(todosProvider.notifier).init([]);
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    final List<Todo> todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Lesson'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              const CreateTodoArea(),
              for (final Todo todo in todos)
                TodoItem(
                  todo: todo,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
