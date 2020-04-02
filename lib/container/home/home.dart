import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF373737), //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('首页', style: TextStyle(color: Colors.black),),
      ),
    );
  }
}