import 'package:flutter/material.dart';

void showErrorMessage({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xFFD21002),
      content: Text(message),
    ),
  );
}
