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
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(//阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            offset: Offset(1, 1),
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 8.0,
            //spreadRadius: 1.0
          )
        ] 
      )
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
                buildAccountMessage()
              ],
            ),
          ),
        ),
      )
    );
  }
}