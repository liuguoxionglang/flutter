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
          //设置应用各控件的主题颜色
          theme: ThemeData(
            primaryColor: Colors.red,
          ),
          home :new DefaultTabController(
            length: choices.length,
           // 主页面
            child: Scaffold(
              //1.设置应用栏，显示在脚手架顶部
              appBar: AppBar(
                title: Text('appBar'),
                //标题前面的控件
                leading: Icon(Icons.access_alarm),
                // toolbar中所显示的菜单
                actions: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.assessment),
                  ),
                  new IconButton(
                    icon: new Icon(Icons.assignment),
                  ),
                ],
                // // 显示在appBar控件下方
                flexibleSpace: Container(
                  color: Colors.green,
                  width: 200,
                  child: Text("aaaaaaaaaa"),
                  height:50,
                ),
                // appBar的颜色，默认themedata.primaryColor
                backgroundColor: Colors.deepOrange,
                primary: true,

              ),
            ),
            ),
          
    );

  }

}

// 入口函数
void main()=> runApp(myApp());

