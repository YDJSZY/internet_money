import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/action/index.dart';
import '../../redux/index.dart';

class TakeApprentice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TakeApprentice();
  }
}

class _TakeApprentice extends State<TakeApprentice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF373737), //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('收徒', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        alignment: Alignment.center
      ),
    );
  }
}