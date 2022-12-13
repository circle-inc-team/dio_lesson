import 'package:dio_lesson/model/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/user/user_api.dart';
import '../provider/token_provider.dart';
import '../widget/show_error_message.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final UserAPI userAPI = UserAPI();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ユーザー名'),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'ユーザー名を入力してください';
                  }
                  return null;
                },
                onChanged: (String value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  return null;
                },
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var res = await userAPI.login(
                      username: username,
                      password: password,
                    );
                    if (res == null) {
                      showErrorMessage(
                        context: context,
                        message: 'ログインに失敗しました',
                      );
                      return;
                    }
                    ref.read(tokenProvider.notifier).init(
                          token: Token(
                            refresh: res.data['refresh'],
                            access: res.data['access'],
                          ),
                        );
                  }
                },
                child: const Text('ログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
