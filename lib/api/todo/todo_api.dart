import 'package:dio/dio.dart';
import 'package:dio_lesson/api/auth_interceptor.dart';

import '../base_option.dart';

class TodoAPI {
  final Dio dio = Dio(
    baseOptions,
  );
  TodoAPI({required String access}) {
    dio.interceptors.add(getAuthInterceptor(access: access));
  }

  Future<dynamic> get() async {
    const String url = 'api/todos';
    try {
      return await dio.get(
        url,
      );
    } on DioError {
      return null;
    }
  }

  Future<dynamic> create({required String text}) async {
    const String url = 'api/todo/create';
    Map<String, dynamic> data = {
      'text': text,
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

  Future<dynamic> delete({required String id}) async {
    const String url = 'api/todo/delete';
    Map<String, dynamic> data = {
      'id': id,
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

  Future<dynamic> toggle({required String id}) async {
    const String url = 'api/todo/update_is_done';
    Map<String, dynamic> data = {
      'id': id,
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
