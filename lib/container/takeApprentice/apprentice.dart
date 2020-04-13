import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import '../../redux/action/index.dart';
//import '../../redux/index.dart';
import './components/profit.dart';
import './components/profitTab.dart';

class Apprentice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Apprentice();
  }
}

class _Apprentice extends State<Apprentice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(19),
            child: Profit({
              'integral': '500,376,200',
              'title1': '累计收徒',
              'title2': '累计被动收益',
              'title3': '立即邀请徒弟',
              'amount1': '20',
              'amount2': '0'
            }),
          ),
          Expanded(
            child: ProfitTab('正式徒弟', '潜在徒弟', [
              {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}
              ], [{'image': '', 'name': '小胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '小胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '大胖', 'taskAmount': 20, 'profit': 100}, {'image': '', 'name': '小胖', 'taskAmount': 20, 'profit': 100},]),
          )
        ],
      ),
    );
  }
}