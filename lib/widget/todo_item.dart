import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';
import '../provider/todos_provider.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;

  Future<void> showMyDialog(BuildContext context, WidgetRef ref) async {
    return await showDialog<void>(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          title: const Text('Todoの削除'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('本当に削除してよろしいですか？'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () async {
                ref.read(todosProvider.notifier).removeTodo(todo.id);
                Navigator.pop(context);
              },
              child: const Text('削除する'),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(todo.text),
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (bool? value) async {
            ref.read(todosProvider.notifier).toggle(todo.id);
          },
        ),
        trailing: GestureDetector(
          onTap: () async {
            await showMyDialog(context, ref);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEB4438),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
