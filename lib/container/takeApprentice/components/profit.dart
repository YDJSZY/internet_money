import 'package:flutter/material.dart';

class Profit extends StatelessWidget {
  Map<String, String> data = {};
  String integral;
  String title1;
  String title2;
  String amount1;
  String amount2;
  String title3;
  String jumpUrl;

  Profit(this.data);

  Widget buildIntegral() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('账号积分', style: TextStyle(color: Color(0xFF0098FF), fontSize: 16)),
          Padding(
            padding: EdgeInsets.only(top: 17),
            child: Text(data['integral'], style: TextStyle(color: Color(0xFF0098FF), fontSize: 30, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget buildProfitType() {
    return Container(
      margin: EdgeInsets.only(top: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildType(data['title1'], data['amount1']),
          buildType(data['title2'], data['amount1']),
          Container(
            width: 70,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xFF009CFF),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data['title3'], style: TextStyle(color: Colors.white, fontSize: 13)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 12)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildType(String title, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(color: Color(0xFF696969), fontSize: 15)),
        Padding(
          padding: EdgeInsets.only(top: 19),
          child: Text(amount, style: TextStyle(color: Color(0xFF0083FF), fontSize: 24))
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22, left: 20, right: 20, bottom: 22),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(//阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            offset: Offset(1, 1),
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 8.0,
          )
        ] 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildIntegral(),
          buildProfitType()
        ],
      ),
    );
  }
}