import 'package:flutter/material.dart';

@immutable
class Todo {
  const Todo({
    required this.id,
    required this.text,
    required this.isDone,
  });

  final String id;
  final String text;
  final bool isDone;

  Todo copyWith({
    String? id,
    String? text,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
    );
  }
}
