import 'package:flutter/material.dart';

const InputDecoration createTodoInputStyle = InputDecoration(
  hintText: 'ToDoを入力してください',
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black26,
    ),
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 4,
    horizontal: 12,
  ),
);
