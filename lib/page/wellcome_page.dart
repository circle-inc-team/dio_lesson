import 'package:dio_lesson/model/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/user/user_api.dart';
import '../provider/token_provider.dart';

class WellcomePage extends ConsumerStatefulWidget {
  const WellcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WellcomePageState();
}

class _WellcomePageState extends ConsumerState<WellcomePage> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final UserAPI userAPI = UserAPI();

  Future<void> setup() async {
    final String? refresh = await storage.read(key: 'refresh');

    if (refresh == null) {
      if (!mounted) return;
      Navigator.of(context).pushNamed('login');
    } else {
      var res = await userAPI.getTokens(refresh: refresh);
      final String access = res.data['access'];
      ref.read(tokenProvider.notifier).init(
            token: Token(
              refresh: refresh,
              access: access,
            ),
          );
      if (!mounted) return;
      Navigator.of(context).pushNamed('todo');
    }
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
