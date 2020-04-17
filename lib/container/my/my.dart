import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
/* import '../../redux/action/index.dart';
import '../../redux/index.dart'; */

class My extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _My();
  }
}

class _My extends State<My> with SingleTickerProviderStateMixin {
  List<Map> jumpList1 = [
    {"title": "绑定账号", "more": true},
    {"title": "团队管理", "more": true},
    {"title": "积分明细", "more": true},
    {"title": "积分明细", "more": true},
    {"title": "邀请好友", "more": true},
    {"title": "帮助反馈", "more": true},
    {"title": "关于我们", "more": true},
    {"title": "版本号", "more": false, "des": "v1.0.1"}
  ];

  Widget buildHeader() {
    return Padding(
      padding: EdgeInsets.all(20),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('Bagus Yuliono', style: TextStyle(color: Colors.white, fontSize: 12))
                      ),
                      Text('赚客', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text('邀请码：20154107', style: TextStyle(color: Colors.white, fontSize: 12)),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: GestureDetector(
                  child: Text('复制', style: TextStyle(color: Colors.white, fontSize: 12))
                ),
              ),
            ],
          )
        ],
      )
    );
  }

  Widget buildProfit() {
    return Padding(
      padding: EdgeInsets.fromLTRB(19, 0, 19, 19),
      child: Container(
        padding: EdgeInsets.all(20),
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
            Text('账号积分', style: TextStyle(color: Color(0xFF0098FF), fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('500,376,200', style: TextStyle(color: Color(0xFF0098FF), fontSize: 30)),
                Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF009CFF),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('立即', style: TextStyle(color: Colors.white, fontSize: 13),),
                      Text('提现', style: TextStyle(color: Colors.white, fontSize: 13),),
                    ],
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buildProfitType(),
              ),
            )
          ],
        ),
      )
    );
  }

  List<Widget> buildProfitType() {
    List<Map> profitList = [
      {"title": "任务收益", "account": 20},
      {"title": "分佣收益", "account": 0},
      {"title": "累计收益", "account": 0},
      {"title": "今日收益", "account": 0}
    ];
    List<Widget> container = [];
    container = profitList.map((item) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item['title'], style: TextStyle(color: Color(0xFF696969), fontSize: 15)),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(item['account'].toString(), style: TextStyle(color: Color(0xFF0083FF), fontSize: 15))
          )
        ],
      );
    }).toList();
    return container;
  }

  Widget buildJumpItem(item) {
    return Container(
      margin: item['title'] == '邀请好友' ? EdgeInsets.only(top: 17) : EdgeInsets.zero,
      padding: EdgeInsets.fromLTRB(19, 18, 19, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF8F9FE), width: 1))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(item['title'], style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 15)),
          item['more'] ? Icon(Icons.keyboard_arrow_right, color: Color(0xFFA9A9A9), size: 24,) : Text(item['des'], style: TextStyle(color: Color(0xFF828282), fontSize: 15)),
        ],
      ),
    );
  }

  Widget buildJumpList() {
    return Container(
      margin: EdgeInsets.only(top: 36),
      child: Padding(
        padding: EdgeInsets.only(bottom: 17),
        child: Column(
          children: jumpList1.map((item) {
            return buildJumpItem(item);
          }).toList(),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
            //height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              //color: Color(0xFFF8F9FE),
              image: DecorationImage(
                image: AssetImage('lib/assets/imgs/vv_login_bg.jpg'),
                //fit: BoxFit.cover,
                alignment: Alignment.topCenter
              ),
            ),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildHeader(),
                    buildProfit(),
                    Flexible(
                      child: buildJumpList(),
                    )
                  ],
                ),
            ),
        ),
          )
      );
  }
}