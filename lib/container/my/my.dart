import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/action/index.dart';
import '../../redux/index.dart';

class My extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _My();
  }
}

class _My extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF373737), //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('我的', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () { 
            store.dispatch({'type': StorageActions.SetLogout}); 
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);},//进入登录页，删除前面的所有路由,
          child: Text('登出'),
        ),
      ),
    );
  }
}