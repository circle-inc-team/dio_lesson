import 'package:dio/dio.dart';

InterceptorsWrapper getAuthInterceptor({required String access}) {
  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers = {
        'Authorization': 'Bearer $access',
      };
      return handler.next(options);
    },
  );
}
