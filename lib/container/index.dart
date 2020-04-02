import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './home/home.dart';
import './my/my.dart';

class InitGMS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InitGMS();
  }
}

class _InitGMS extends State<InitGMS> {
  List<Widget> containerList = [];
  int _currentIndex = 0;
  PageController _pageController;
  Function assetPageCb;
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    final home = Home();
    final my = My();
    containerList = [
      home,
      my
    ];
    _pageController = PageController(initialPage: _currentIndex, keepPage: true);
  }

  setCurrentPageIndex(index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  openWalletDrawer(Function cb) {
    assetPageCb = cb;
    _key.currentState.openDrawer();
  }

  onSelectWallet() {
    assetPageCb();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<dynamic, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          return Scaffold(
            key: _key,
            body: PageView(
              children: containerList,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // 禁止左右切换
            ),
            bottomNavigationBar: BottomNavigationBar(
              //backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: setCurrentPageIndex,
              fixedColor: Color(0xFF2D303A), // 路由激活颜色
              unselectedItemColor: Color(0xFFA2A2A2), // 未激活颜色
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home, 
                    size: 22
                  ),
                  title: Text('首页', style: TextStyle(fontSize: 10)),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person, 
                    size: 22
                  ),
                  title: Text('我的', style: TextStyle(fontSize: 10)),
                )
              ]
            ),
          );
        }
    );
  }
}