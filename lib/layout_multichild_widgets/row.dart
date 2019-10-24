import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.pink
      ),
      home:MyStatePage(),
    );
  }
}



class MyStatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStatePageState();
  }
}

class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴对齐方式，子项均分布局空间
          mainAxisSize: MainAxisSize.min,/// 子组件在主轴上应占用的控件
          crossAxisAlignment: CrossAxisAlignment.center,// 次轴对齐方式 此处为垂直方向
          textDirection: TextDirection.rtl,// 子项的水平排列顺序 
          verticalDirection: VerticalDirection.down, // 好像没毛用
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Expanded(
              child: Image.asset("assets/images/2.jpg"),
            ),
            Expanded(
              child: Text('row', textAlign: TextAlign.center),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





