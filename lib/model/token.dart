import 'package:flutter/material.dart';

@immutable
class Token {
  const Token({
    required this.refresh,
    required this.access,
  });

  final String refresh;
  final String access;

  Token copyWith({
    String? refresh,
    String? access,
  }) {
    return Token(
      refresh: refresh ?? this.refresh,
      access: access ?? this.access,
    );
  }
}
