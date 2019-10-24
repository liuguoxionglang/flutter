import 'package:flutter/material.dart';
// 入口函数
void main()=> runApp(myApp());

class myApp extends StatelessWidget {

  Widget build(BuildContext context){

      return new MaterialApp(
          title: 'borderPractice',
          home: Scaffold(
            //1.设置应用栏，显示在脚手架顶部
            appBar: AppBar(
              title: Text('scaffold测试'),
            ),
            // 设置脚手架中间内容区域的内容
            body: Container(
              child: Text("内容"),
            ),
            // 设置显示在上层区域的按钮，默认位置右下角
            floatingActionButton:FloatingActionButton(
              tooltip: "新增",
              child: Icon(Icons.add),
            ), 
        ),
    );

  }

}
