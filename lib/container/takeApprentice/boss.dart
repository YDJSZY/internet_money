import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/action/index.dart';
import '../../redux/index.dart';
import './components/profit.dart';

class Boss extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Boss();
  }
}

class _Boss extends State<Boss> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(19),
            child: Profit({
              'integral': '500,376,200',
              'title1': '累计金主',
              'title2': '累计被动收益',
              'title3': '立即邀请金主',
              'amount1': '20',
              'amount2': '0'
            }),
          )
        ],
      ),
    );
  }
}