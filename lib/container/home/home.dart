import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  Widget buildUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bagus Yuliono', style: TextStyle(color: Colors.white, fontSize: 12)),
            Padding(
              padding: EdgeInsets.only(top: 13),
              child: Row(
                children: <Widget>[
                  Text('赚客', style: TextStyle(color: Colors.white, fontSize: 20)),
                  Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: GestureDetector(
                      child: Container(
                        width: 65,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text('升级代理商', style: TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 45,
          height: 45,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }

  Widget buildAccountMessage() {
    return Container(
      margin: EdgeInsets.only(top: 24),
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
          buildTeamMember()
        ],
      ),
    );
  }

  Widget buildIntegral() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('账号积分', style: TextStyle(color: Color(0xFF0098FF), fontSize: 16)),
          Padding(
            padding: EdgeInsets.only(top: 17),
            child: Text('500,376,200', style: TextStyle(color: Color(0xFF0098FF), fontSize: 30, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget buildTeamMember() {
    return Container(
      margin: EdgeInsets.only(top: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildMember('团队成员', 20),
          buildMember('本周新增成员', 0),
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
                Text('立即邀请好友', style: TextStyle(color: Colors.white, fontSize: 13)),
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

  Widget buildMember(String title, int memberAmount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(color: Color(0xFF696969), fontSize: 15)),
        Padding(
          padding: EdgeInsets.only(top: 19),
          child: Text(memberAmount.toString(), style: TextStyle(color: Color(0xFF0083FF), fontSize: 24))
        )
      ],
    );
  }

  Widget buildDouYinTask() {
    return Container(
      margin: EdgeInsets.only(top: 28),
      padding: EdgeInsets.only(top: 15, left: 19, right: 19, bottom: 15),
      decoration: BoxDecoration(
        color: Color(0xFF170B1A),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.music_note, color: Colors.white, size: 20),
              Padding(
                padding: EdgeInsets.only(left: 9),
                child: Text('抖音任务', style: TextStyle(color: Colors.white, fontSize: 20))
              )
            ],
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 9),
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Color(0xFF2E2E2E))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Color(0xFF2E2E2E), width: 1))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      douyinTaskTitle('当前使用账号'),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: CircleAvatar(
                                  radius: 35,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('BIGMAN', style: TextStyle(color: Colors.white, fontSize: 14)),
                                Text('正常', style: TextStyle(color: Color(0xFF009CFF), fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: douyinTaskAction('切换账号', Icons.swap_horiz, () {}),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Color(0xFF2E2E2E), width: 1))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      douyinTaskTitle('今日可用账号'),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: '5', style: TextStyle(color: Color(0xFF009CFF), fontSize: 15)),
                              TextSpan(text: '/10', style: TextStyle(color: Colors.white, fontSize: 15))
                            ]
                          )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: douyinTaskAction('新增绑定', Icons.add_circle, () {}),
                      )
                    ],
                  )
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      douyinTaskTitle('任务数量'),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('3000', style: TextStyle(color: Color(0xFF009CFF), fontSize: 15)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: douyinTaskAction('开始任务', Icons.chevron_right, () {}),
                      )
                    ]
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget douyinTaskTitle(String title) => Text(title, style: TextStyle(color: Color(0xFF909090), fontSize: 13));

  Widget douyinTaskAction(String title, IconData icon, Function cb) {
    return GestureDetector(
      onTap: cb,
      child: Row(
        children: <Widget>[
          Text(title, style: TextStyle(color: Color(0xFF009CFF), fontSize: 15)),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Icon(icon, color: Color(0xFF009CFF), size: 15),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        image: DecorationImage(
          image: AssetImage('lib/assets/imgs/vv_login_bg.jpg'),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 18, right: 18, top: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildUser(),
                buildAccountMessage(),
                buildDouYinTask()
              ],
            ),
          ),
        ),
      )
    );
  }
}