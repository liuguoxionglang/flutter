import 'package:flutter/material.dart';

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

class myApp extends StatelessWidget {

  Widget build(BuildContext context){

      return new MaterialApp(
          title: 'appBar title',
          home :new DefaultTabController(
            length: choices.length,
           // 主页面
            child: Scaffold(
              appBar: AppBar(
                title: Text('tabBar'),
                backgroundColor: Colors.grey,
                //一个appbarBottomWidget对象，通常用tabBar
                bottom: new TabBar(
                  isScrollable: true,// 是否可水平滚动,
                  //tabBar的标签内容 通常是用tab，可以用其他
                  tabs: choices.map((Choice choice) {
                    return new Tab(
                      text: choice.title,
                      icon: new Icon(choice.icon),
                    );
                  }).toList(),
                  // 指示器颜色
                  indicatorColor: Colors.black,
                  //指示器装饰
                  indicator: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.black)
                  ),
                  // tab标签颜色
                  labelColor: Colors.lightGreen,
                 
                ) ,
              ),
    
            ),
            ),
          
    );

  }

}

// 入口函数
void main()=> runApp(myApp());

