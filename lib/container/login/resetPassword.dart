import 'package:flutter/material.dart';
import 'commomWidget.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetPassword();
  }
}

class _ResetPassword extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF1F1F1F)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('忘记密码', style: TextStyle(color: Color(0xFF333333), fontSize: 24)),
              Container(
                margin: EdgeInsets.only(top: 116, bottom: 98),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildPhone(),
                    buildImageCaptcha(),
                    buildPhoneCaptcha(),
                    buildPassword()
                  ],
                ),
              ),
              buildConfirmBtn()
            ],
          ),
        ),
      ),
    );
  }
}