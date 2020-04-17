import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/action/index.dart';
import '../../redux/index.dart';
import 'apprentice.dart';
import 'boss.dart';

class TakeApprentice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TakeApprentice();
  }
}

class _TakeApprentice extends State<TakeApprentice> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    // 添加监听器
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FE),
        image: DecorationImage(
          image: AssetImage('lib/assets/imgs/vv_login_bg.jpg'),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.only(top: 15),
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 230,
                    child: TabBar(
                      controller: tabController,
                      labelStyle: TextStyle(fontSize: 20),
                      labelColor: Colors.white,
                      unselectedLabelStyle: TextStyle(fontSize: 15),
                      unselectedLabelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      labelPadding: EdgeInsets.only(bottom: 10),
                      tabs: <Widget>[
                        Tab(text: '收徒躺钱'),
                        Tab(text: '金主分成')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          Apprentice(),
                          Boss()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      )
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}