import 'package:dio_lesson/api/todo/todo_api.dart';
import 'package:dio_lesson/provider/token_provider.dart';
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
    final TodoAPI todoAPI = TodoAPI(access: ref.read(tokenProvider).access);
    var res = await todoAPI.get();
    List<Todo> todos = res.data.map<Todo>((dynamic data) {
      return Todo(
        id: data['id'],
        text: data['text'],
        isDone: data['isDone'],
      );
    }).toList();
    ref.read(todosProvider.notifier).init(todos);
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
        title: const Text('Riverpod Lesson'),
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
