import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //提供SystemUiOverlayStyle
import 'dart:io';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'redux/index.dart';
import 'apiRequest/dioConfig.dart';
import 'routeBuilder/index.dart';
import './components/loading/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final store = await initStore();
  dioConfig(store, navigatorKey); // dio请求配置

  runApp(new MyApp(store: store, navigatorKey: navigatorKey)); // 传入store
  
  if (Platform.isAndroid) {
   // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前       MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final Store store;
  final GlobalKey navigatorKey;
  MyApp({this.store, this.navigatorKey});
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  bool isLogin;

  @override
  void initState() {
    super.initState();
    isLogin = widget.store.state.storage.isLogin;
    BackButtonInterceptor.add(listenBackButton);
  }

  bool listenBackButton(bool stopDefaultButtonEvent) { // 监听安卓返回键
    OkLoading.hide();
    return false; // false才会后退
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<dynamic> (
      store: widget.store,
      child: OKToast(
        child: OkLoading(
          child: MaterialApp(
            title: 'GMS',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(brightness: Brightness.light)
            ),
            // home: SplashPage(),
            navigatorKey: widget.navigatorKey,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              return routeBuilder(settings, isLogin);
            }
          ),
        )
      )
    );
  }
}
