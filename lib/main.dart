import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'page/login_page.dart';
import 'page/todo_page.dart';
import 'page/wellcome_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Lesson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WellcomePage(),
      routes: <String, WidgetBuilder>{
        'wellcome': (BuildContext context) {
          return const WellcomePage();
        },
        'login': (BuildContext context) {
          return const LoginPage();
        },
        'todo': (BuildContext context) {
          return const TodoPage();
        },
      },
    );
  }
}
