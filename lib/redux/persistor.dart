import 'dart:convert';

import 'package:redux/redux.dart';
import '../utils/sharedPreferences.dart';

class JsonSerializer<T> {
  final T Function(Map<String, dynamic> json) fromJson;

  JsonSerializer(this.fromJson);
}

class Persistor<T> {
  String sharedPreferencesKey;
  JsonSerializer serializer;
  T appState;

  Persistor(this.sharedPreferencesKey, this.serializer);

  T getState() {
    var storageData;
    var sharedPreferencesData = globalPrefs.getString(sharedPreferencesKey);
    if (sharedPreferencesData != 'null' && sharedPreferencesData != null) {
      storageData = jsonDecode(sharedPreferencesData);
    } else {
      storageData = Map<String, dynamic>();
    }
    appState = serializer.fromJson(storageData);
    return appState;
  }

  middleware(Function toJson) {
    return (Store store, dynamic action, NextDispatcher next) {
      next(action);
      var data = toJson();
      globalPrefs.setString(sharedPreferencesKey, json.encode(data));
    };
  }
}