import 'package:flutter/material.dart';

final hintStyle = TextStyle(color: Color(0xFF999999), fontSize: 16);

Widget textFieldContainer({Widget child}) {
  return Container(
    height: 44,
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFFBBBBBB)),
      borderRadius: BorderRadius.all(Radius.circular(7))
    ),
    child: child == null ? Container() : child
  );
}

Widget buildPhone() {
  return textFieldContainer(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 2, color: Color(0xFFDCDCDC)))
          ),
          child: Text('86', style: TextStyle(color: Color(0xFF999999), fontSize: 16)),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入手机号码',
              border: InputBorder.none,
            )
          ),
        )
      ],
    ),
  );
}

Widget buildImageCaptcha() {
  return textFieldContainer(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入图形验证码',
              hintStyle: hintStyle,
              border: InputBorder.none
            ),
          ),
        ),
        GestureDetector(
          child: Text('获取验证码', style: TextStyle(color: Color(0xFF009CFF), fontSize: 14)),
        )
      ],
    )
  );
}

Widget buildPhoneCaptcha() {
  return textFieldContainer(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入验证码',
              hintStyle: hintStyle,
              border: InputBorder.none
            ),
          ),
        ),
        GestureDetector(
          child: Text('获取验证码', style: TextStyle(color: Color(0xFF009CFF), fontSize: 14)),
        )
      ],
    )
  );
}

Widget buildPassword() {
  return textFieldContainer(
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: '请输入密码',
        hintStyle: hintStyle,
        border: InputBorder.none
      ),
    )
  );
}

Widget buildConfirmBtn() {
    return Container(
      width: double.maxFinite,
      height: 44,
      child: RaisedButton(
        onPressed: () {},
        child: Text('确认', style: TextStyle(color: Colors.white, fontSize: 16)),
        color: Color(0xFF009CFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
      ),
    );
  }