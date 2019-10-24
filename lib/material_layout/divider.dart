import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("data"),
              Divider(
                height: 50,//分隔符组件的高
                indent: 15,//分隔符左侧的空格数量
                color: Colors.blue,// 分隔符的颜色
              ),

            ],
          ),
        ),
      ),
    );
  }
}