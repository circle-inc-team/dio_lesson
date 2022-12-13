import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../style/todo_style.dart';

class CreateTodoArea extends ConsumerStatefulWidget {
  const CreateTodoArea({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTodoAreaState();
}

class _CreateTodoAreaState extends ConsumerState<CreateTodoArea> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String text = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 90,
      width: size.width,
      child: Form(
        key: _formKey,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width - 130,
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: createTodoInputStyle,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'ToDoが入力されていません';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: text.isEmpty == true
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          // ref.read(todosProvider.notifier).addTodo(
                          //       Todo(
                          //         id: '',
                          //         text: '',
                          //         isDone: false,
                          //       ),
                          //     );

                          setState(() {
                            text = '';
                          });
                          _formKey.currentState!.reset();
                          if (!mounted) return;
                          FocusScope.of(context).unfocus();
                        }
                      },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('送信'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
