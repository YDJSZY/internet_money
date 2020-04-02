import 'package:flutter/material.dart';
import 'commomWidget.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  Widget buildInviteCode() {
    return textFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          hintText: '邀请码',
          hintStyle: hintStyle,
          border: InputBorder.none
        ),
      )
    );
  }

  Widget buildLogin() {
    return Row(
      children: <Widget>[
        Text('已有账号？', style: TextStyle(color: Color(0xFF999999), fontSize: 14)),
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () { Navigator.of(context).pop(); },
            child: Text('登录', style: TextStyle(color: Color(0xFF009CFF), fontSize: 14)),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('注册账号', style: TextStyle(color: Color(0xFF333333), fontSize: 24)),
              Container(
                margin: EdgeInsets.only(top: 64),
                child: Column(
                  children: <Widget>[
                    buildPhone(),
                    buildImageCaptcha(),
                    buildPhoneCaptcha(),
                    buildPassword(),
                    buildInviteCode(),
                    Container(
                      margin: EdgeInsets.only(top: 92, bottom: 28),
                      child: buildConfirmBtn()
                    ),
                    buildLogin()
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}