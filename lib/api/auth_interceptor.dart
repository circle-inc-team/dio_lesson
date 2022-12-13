import 'package:dio/dio.dart';

InterceptorsWrapper getAuthInterceptor({required String access}) {
  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      return handler.next(options);
    },
  );
}
