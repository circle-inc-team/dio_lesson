import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WellcomePage extends ConsumerStatefulWidget {
  const WellcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WellcomePageState();
}

class _WellcomePageState extends ConsumerState<WellcomePage> {
  Future<void> setup() async {}

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
