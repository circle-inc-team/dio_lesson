import 'package:dio/dio.dart';

import '../base_option.dart';

class UserAPI {
  final Dio dio = Dio(
    baseOptions,
  );

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    const String url = 'auth/jwt/create';
    final Map<String, String> data = {
      'username': username,
      'password': password,
    };
    try {
      return await dio.post(
        url,
        data: data,
      );
    } on DioError {
      return null;
    }
  }
}
