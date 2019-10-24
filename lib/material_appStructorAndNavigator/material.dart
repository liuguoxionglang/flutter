import 'package:flutter/material.dart';
// 入口函数
void main()=> runApp(myApp());

class myApp extends StatelessWidget {

  Widget build(BuildContext context){

      return new MaterialApp(
          title: 'material title',
          //设置应用各控件的主题颜色
          theme: ThemeData(
            primaryColor: Colors.red,
            ),
          color: Colors.green,
          // 主页面
          home: Scaffold(
            //1.设置应用栏，显示在脚手架顶部
            appBar: AppBar(
              title: Text('material顶部按钮'),
            ),
            body: Center(child: Text("data material"),),
          ),
          // 定义页面路由的跳转规则，当使用 Navigator.pushNamed 来路由的时候，
          //会在 routes 查找路由名字，然后使用 对应的 WidgetBuilder 来构造一个带有页面切换动画的 MaterialPageRoute
          // 若是单页面时，则不需要此项，
          routes: <String,WidgetBuilder>{
              "/materialApp":(BuildContext context)=>TabBarView(),
          }, 
    );

  }

}
