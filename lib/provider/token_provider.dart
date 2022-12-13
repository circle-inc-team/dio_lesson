import 'package:dio_lesson/model/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Token initialState = const Token(refresh: '', access: '');

class TokenNotifier extends StateNotifier<Token> {
  TokenNotifier() : super(initialState);

  void init({required Token token}) {
    state = token;
  }
}

final tokenProvider = StateNotifierProvider<TokenNotifier, Token>((ref) {
  return TokenNotifier();
});
