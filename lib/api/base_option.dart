import 'package:dio/dio.dart';

const baseUrl = 'https://circle-inc-backend.jp.ngrok.io/';

final BaseOptions baseOptions = BaseOptions(
  baseUrl: baseUrl,
  contentType: 'application/json',
  connectTimeout: 10000,
  receiveTimeout: 5000,
);
