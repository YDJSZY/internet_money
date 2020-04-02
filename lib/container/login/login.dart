import 'package:flutter/material.dart';
//import 'package:oktoast/oktoast.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import '../../redux/action/index.dart';
import '../../redux/state/index.dart';
import '../../apiRequest/index.dart' as request;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  String email;
  String password;

  emailOnChange(val) {
    setState(() {
      email = val;
    });
  }

  passwordOnChange(val) {
    setState(() {
      password = val;
    });
  }

  submitLogin(store) async {
    print('email: $email');
    print('password: $password');
    var data = {
      "loginName": email,
      "password": password,
    };
    print(data);
    request.WithLoading.show(() async {
      /* var res = await request.login();
      request.WithLoading.hide();
      print(res);
      store.dispatch({'type': StorageActions.SetUserInfo, 'data': user});
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);//进入首页，删除前面的所有路由 */
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new StoreConnector<dynamic, Store<GlobalState>>(
      converter: (store) => store,
      builder: (context, store) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('欢迎登录', style: TextStyle(color: Color(0xFF333333), fontSize: 24)),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Theme(
                            data: ThemeData(primaryColor: Color(0xFFBBBBBB), hintColor: Color(0xFFBBBBBB)),
                            child: TextField(
                            onChanged: emailOnChange,
                            decoration: InputDecoration(
                              hintText: '请输入手机',
                              prefixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.all(10.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(color: Color(0xFFBBBBBB))
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(color: Color(0xFFBBBBBB))
                              )
                            ),
                          ),
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Theme(
                            data: ThemeData(primaryColor: Color(0xFFBBBBBB), hintColor: Color(0xFFBBBBBB)),
                            child: TextField(
                              onChanged: passwordOnChange,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: '密码',
                                prefixIcon: Icon(Icons.vpn_key),
                                contentPadding: EdgeInsets.all(10.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                  borderSide: BorderSide(color: Color(0xFFBBBBBB))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                  borderSide: BorderSide(color: Color(0xFFBBBBBB))
                                )
                              ),
                            ),
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('还没有账号？', style: TextStyle(color: Color(0xFF999999), fontSize: 14)),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: GestureDetector(
                                    onTap: () { Navigator.of(context).pushNamed('/register'); },
                                    child: Text('注册', style: TextStyle(color: Color(0xFF009CFF), fontSize: 14))
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () { Navigator.of(context).pushNamed('/resetPassword'); },
                              child: Text('忘记密码', style: TextStyle(color: Color(0xFF009CFF), fontSize: 14)),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            width: double.maxFinite,
                            height: 45,
                            child: RaisedButton(
                              onPressed: (email == null || password == null) ? null : () { submitLogin(store); },
                              color: Color(0xFFffa22d),
                              disabledColor: Color(0xFFDCDCDC),
                              child: Text('登录', style: TextStyle(color: Colors.white, fontSize: 16)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      })
    );
  }
}