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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home:new Scaffold(
        appBar: new AppBar(
          title:Text("drawer"),
        ),
        drawer:Drawer(
          child: DrawerHeader(
            // 装饰器 此处只设置了颜色
            decoration: BoxDecoration(color: Colors.blueGrey),
            //滑动时间  好像没起作用？？
            duration: Duration(seconds: 5,minutes: 1),
            // 滑动效果  
            curve: Curves.easeOut,
            //组件子项
            child: Center(child: Text("data"),),

          ),
          // // 抽屉内容组件
          // child:  ListView(
          //   padding: EdgeInsets.zero,
          //   children: <Widget>[
          //     UserAccountsDrawerHeader(
          //       // 用户名
          //       accountName: Text('liuguoxioanglang'),
          //       //用户邮箱
          //       accountEmail: Text('liuguo4444@163.com'),
          //       // 当前用户头像
          //       currentAccountPicture: CircleAvatar(
          //         child: Icon(Icons.picture_in_picture),
          //       ),
          //       // 其他用户头像
          //       otherAccountsPictures: <Widget>[
          //         CircleAvatar(child: Icon(Icons.ac_unit),),
          //         CircleAvatar(child: Icon(Icons.hot_tub),),
          //       ],
          //       // 外边距
          //       margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          //       // 装饰器
          //       decoration: BoxDecoration(color: Colors.grey),
          //     ),
          //     // 用ListTile设置列表项
          //     ListTile(
          //       leading: Icon(Icons.local_post_office),
          //       title: Text('邮件'),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.settings),
          //       title: Text('设置'),
          //     )
          //   ],
          // ),
          
          semanticLabel: "开始sssssss", // 没卵用啊？？
        )

      ),
    );
  }
}

// 入口函数
void main()=> runApp(myApp());

