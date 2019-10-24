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

class _appTabBarView extends State<myApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 初始化tabController，保证tabBarView子组件长度与tabBar长度一致
    _tabController = new TabController(vsync: this, length: choices.length);
     //监听tab切换的回调
    // _tabController.addListener(() {
    //   var index = _tabController.index;
    //   AlertDialog(title: new Text("dd"));
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  // 点击箭头时的回调函数
  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length)
      return;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home:new Scaffold(
        appBar: new AppBar(
          title:Text("tabBarView"),
          // 顶部标题前面按钮
          leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            onPressed: () { _nextPage(-1); },
          ),
          // widgets列表，通常显示三个点
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.arrow_forward),
              tooltip: 'Next choice',
              onPressed: () { _nextPage(1); },
            ),
          ],
          // 标题下面的一个Tab导航栏
          bottom:new PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: new Container(
                height: 48.0,
                alignment: Alignment.center,
                child: new TabPageSelector(controller: _tabController),
              ),
            ),
          ),
        ),


        body: new TabBarView(
          // 控制器
          controller: _tabController,
          // drawerDragStartBehavior: DragStartBehavior.start,没有？？？
          // 子控件列表
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 入口函数
void main()=> runApp(myApp());

