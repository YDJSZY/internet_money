import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareInput extends StatefulWidget {
  bool clearData = false;
  int inputLen;
  Function callBack;
  Function inputOnChange;

  SquareInput({int inputLen = 6, bool clearData = false, Function inputOnChange, Function callBack}) {
    this.inputLen = inputLen;
    this.callBack = callBack;
    this.clearData = clearData;
    this.inputOnChange = inputOnChange;
  }

  @override
  State<StatefulWidget> createState() {
    return _SquareInput();
  }
}

class _SquareInput extends State<SquareInput> {
  int inputValLen = 0;
  String value;
  TextEditingController inputController = TextEditingController();

  inputOnchange(val) {
    if (val.length > widget.inputLen) return;
    if (val.length == widget.inputLen) {
      if (widget.callBack != null) widget.callBack(val);
    }
    if (widget.inputOnChange != null) widget.inputOnChange(val);
    setState(() {
      inputValLen = val.length;
      value = val;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(SquareInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.clearData) {
      setState(() {
        inputValLen = 0;
        value = '';
      });
      inputController.clear();
    }
  }


  buildBlackDot(bool isEnter) {
    if (isEnter) {
      return Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black
        )
      );
    }
    return null;
  }

  List<Widget> buildSquare() {
    var list = List.generate(widget.inputLen, (int index) => index);
    List<Widget> children = [];
    list.forEach((item) {
      bool isEnter = (item < inputValLen);
      var content = Flexible(
        flex: 1,
        child: Container(
          width: 40,
          height: 32,
          alignment: Alignment.center,
          //padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xFFD8D8D8)))
          ),
          child: buildBlackDot(isEnter),
        )
      );
      children.add(content);
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildSquare().toList(),
          )
        ),
        Positioned(
          child: TextField(
            controller: inputController,
            keyboardType: TextInputType.number,
            style: new TextStyle(color: Colors.transparent), // 文字透明
            cursorWidth: 0, // 隐藏光标
            onChanged: inputOnchange,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none, // 去掉input下划线
              fillColor: Colors.transparent
            ),
          ),
        )
      ],
    );
  }
}