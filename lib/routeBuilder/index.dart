import 'package:flutter/material.dart';
import '../container/login/login.dart';
import '../container/index.dart';
import '../container/login/register.dart';
import '../container/login/resetPassword.dart';

MaterialPageRoute routeBuilder (RouteSettings settings, bool isLogin) {
  //Map arguments = settings.arguments ?? {};
  Map<String, Function> routesConfig = {
    '/': () => MaterialPageRoute(builder: (context) => _checkIsLogin(isLogin, InitGMS())),
    '/login': () => MaterialPageRoute(builder: (context) => Login()),
    '/register': () => MaterialPageRoute(builder: (context) => Register()),
    '/resetPassword': () => MaterialPageRoute(builder: (context) => ResetPassword()),
    '/home': () => MaterialPageRoute(builder: (context) => InitGMS()),
  }; 
  return routesConfig[settings.name]();
}

_checkIsLogin(isLogin, page) {
  return isLogin ? page : InitGMS();
}