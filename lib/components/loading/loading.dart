import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingBody = Container(
  color: Colors.transparent,
  child: Center(
    child: Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 25,
      )
    ),
  ),
);

_OkLoading _okLoading;
class OkLoading extends StatefulWidget {
  final Widget child;

  static show() {
    _okLoading.show();
  }

  static hide() {
    _okLoading.hide();
  }

  OkLoading({@required this.child});

  @override
  State<StatefulWidget> createState() {
    _okLoading = _OkLoading();
    return _okLoading;
  }
}

class _OkLoading extends State<OkLoading> {
  bool showLoading = false;

  show() {
    if (showLoading) return;
    setState(() {
      showLoading = true;
    });
  }

  hide() {
    if (!showLoading) return;
    setState(() {
      showLoading = false;
    });
  }

  Future<bool> _onWillPop() {
    print('loading pop');
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(
        children: <Widget>[
          widget.child,
          showLoading ? loadingBody : Container()
        ],
      )
    );
  }
}