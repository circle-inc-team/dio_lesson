import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';

List<Todo> initialState = [];

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super(initialState);

  void init(List<Todo> todos) {
    state = todos;
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoId) {
    state = state.where((Todo todo) => todo.id != todoId).toList();
  }

  void toggle(String todoId) {
    state = state.map((Todo todo) {
      if (todo.id == todoId) {
        return todo.copyWith(isDone: !todo.isDone);
      }
      return todo;
    }).toList();
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
