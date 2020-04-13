import 'package:flutter/material.dart';

class ProfitTab extends StatefulWidget {
  String tab1;
  String tab2;
  List dataList1;
  List dataList2;

  ProfitTab(this.tab1, this.tab2, this.dataList1, this.dataList2);

  @override
  State<StatefulWidget> createState() {
    return _ProfitTab();
  }
}

class _ProfitTab extends State<ProfitTab> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    // 添加监听器
    tabController = TabController(vsync: this, length: 2);
  }

  List<Widget> buildListView(List dataList) {
    final List<Widget> listView = [];
    dataList.forEach((data) {
      var container = Container(
        padding: EdgeInsets.only(top: 13, bottom: 13, left: 18),
        margin: EdgeInsets.only(bottom: 7),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 44,
              height: 44,
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(data['name'], style: TextStyle(color: Color(0xFF333333), fontSize: 15))
                  ),
                  Row(
                    children: <Widget>[
                      Text('完成任务数量：${data['taskAmount']}', style: TextStyle(color: Color(0xFF999999), fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(left: 37),
                        child: Text('累计收益：${data['profit']}', style: TextStyle(color: Color(0xFF999999), fontSize: 12)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
      listView.add(container);
    });
    return listView;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              labelStyle: TextStyle(fontSize: 18),
              labelColor: Color(0xFF009CFF),
              unselectedLabelColor: Color(0xFF9F9F9F),
              indicatorColor: Color(0xFF009CFF),
              // indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              tabs: <Widget>[
                Tab(text: widget.tab1),
                Tab(text: widget.tab2)
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  ListView(
                    children: buildListView(widget.dataList1),
                  ),
                  ListView(
                    children: buildListView(widget.dataList2),
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }}