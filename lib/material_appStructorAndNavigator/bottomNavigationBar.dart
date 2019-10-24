import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}
// icon信息列表
const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

// 详细显示每个icon图标
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class myApp extends StatefulWidget {
   @override
   _appTabBarView createState() => new _appTabBarView();
 
}

class _appTabBarView extends State<myApp>  {
  int _selectedIndex =0; //默认选中底部导航栏第一个子项

  // 点击底部导航栏底部子项的回调
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // 定义主页面数组
  var _pageList =[
      Center(child: Text("第一页")),
      Center(child: Text("第二页")),
      Center(child: Text("第三页")),
  ];
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home:new Scaffold(
        appBar: new AppBar(
          title:Text("bottomNavigationBar"),
        ),
        // 底部导航栏
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航的子控件列表
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), //底部导航栏子项图标
              title: Text("首页"),//底部导航栏子项标题
              activeIcon: Icon(Icons.add), // 被选中后的图标
              backgroundColor: Colors.red // bottomNavigationBarType为shifting时有效

            ),
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("主体")),
            BottomNavigationBarItem(icon: Icon(Icons.mail),title: Text("我的")),
          ],
          // 当前显示的子项目
          currentIndex: _selectedIndex,
          // 导航栏的显示类型
          type: BottomNavigationBarType.fixed,
          // 选中时候的颜色
          fixedColor: Colors.orange,
          // icon图标大小
          iconSize: 28,
          // 点击子项时的回调函数
          onTap:_onItemTapped ,
        ),
        body: _pageList[_selectedIndex],
        
      ),
    );
  }
}

// 入口函数
void main()=> runApp(myApp());

