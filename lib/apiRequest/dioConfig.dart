import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

dioConfig(store, GlobalKey navigatorKey) {
  dio.options.connectTimeout = 10000; // 请求超时
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) {
      // get请求带有数组时
      var params = options.queryParameters;
      var url = options.path;
      var keys = params.keys.toList();
      var search = '';

      keys.forEach((key) {
        if (params[key] is List) {
          params[key].forEach((item) {
            search = '$search$key=$item&';
          });
          params.remove(key);
        }
      });
      if (search != '') {
        if (search[search.length - 1] == '&') {
          search = search.substring(0, search.length - 1);
        }
        url = '$url?$search';
        options.path = url;
      }
     // 在请求被发送之前做一些事情
      return options; //continue
     // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
     //
     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
     // 这样请求将被中止并触发异常，上层catchError会被调用。
    },
    onResponse: (Response response) {
      //final extra = response.request.extra; // 请求额外参数
      if (response.statusCode == 401) { // token失效
        // navigatorKey.currentState.pushNamed('/login');
      }
      if (response == null) return {'success': false, 'data': null};
      return response; // continue
    },
    onError: (DioError e) {
      // 当请求失败时做一些预处理
      if (e.response?.statusCode == 401) {
        /* navigatorKey.currentState.pushNamed('/login');
        return {'success': false, 'data': '登录失效'}; */
      }
      return e;//continue
    }
  ));
}
