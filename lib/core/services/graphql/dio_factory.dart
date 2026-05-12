// ignore_for_file: lines_longer_than_80_chars

import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = 'https://api.escuelajs.co/api/v1/'
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = SharedPref().getString(PrefKeys.accessToken);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        request: false,
        compact: false,
        responseBody: false,
      ),
    );
  }
}
