import 'dart:io';

import 'package:dio/dio.dart';
import '../apiRequest/dioConfig.dart';
import '../config/index.dart';
import '../components/loading/loading.dart';

final apiPrefix = envApiConfig['apiPrefix'];
final searchTxApi = envApiConfig['searchTxApi'];

class WithLoading {
  static show(Function requestFunc) {
    OkLoading.show();
    requestFunc();
  }
  
  static hide() {
    OkLoading.hide();
  }
}

getEthAddressInfo(address) async {
  try {
    Response response = await dio.get(
      'https://api.ethplorer.io/getAddressInfo/$address?apiKey=freekey'
    );
    return response.data;
  } catch (e) {
    print('getEthAddressInfo: $e');
    return {'ETH': {'balance': '0'}, 'tokens': [], 'success': false};
  }
}

getSingleTokenRate(String symbol, {String curno = 'CNY' }) async {
  try {
    Response response = await dio.get(
      '${apiPrefix}api_kline/api/v1/kline/token/$symbol',
      queryParameters: {'curno': curno}
    );
    if (response.data['success']) {
      var price = response.data['data']['price'] ??= 0;
      if (price is String) {
        return double.parse(price);
      }
      return price;
    }
    return 0;
  } catch (e) {
    return 0;
  }
}

login(Map data) async {
  try {
    Response response = await dio.post(
      'https://www.6569.com/api/user/v1/account/login',
      data: data
    );
    return response.data;
  } catch (e) {
    print(e);
    return [];
  }
}

getTokenLogo() async {
  try {
    Response response = await dio.get(
      '${apiPrefix}twallet_fund/api/v1/logs'
    );
    return response.data['data'];
  } catch (e) {
    return [];
  }
}

getTxsByAddress(Map<String, dynamic> params) async { // 查询交易
  try {
    Response response = await dio.get(
      '${searchTxApi}transaction',
      queryParameters: params
    );
    if (response.data['success']) {
      return response.data['data'];
    }
    return {'data': [], 'count': 0};
  } catch (e) {
    print('getTxsByAddress: $e');
    return {'data': [], 'count': 0};
  }
}