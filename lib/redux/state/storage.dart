class StorageState { // 需要存储在本地的数据
  String language;
  bool isLogin = false;
  Map userInfo;

  StorageState({this.language, this.isLogin, this.userInfo});

  static StorageState fromJson(Map<String, dynamic> parsedJson) {
    return StorageState(
      language: parsedJson['language'],
      isLogin: parsedJson['isLogin'] == null ? false : parsedJson['isLogin'],
      userInfo: parsedJson['userInfo'] == null ? {} : parsedJson['userInfo']
    );
  }

  dynamic toJson() {
    return {'language': language, 'isLogin': isLogin, 'userInfo': userInfo};
  }
}