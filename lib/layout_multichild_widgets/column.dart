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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 主轴对齐方式   此处为垂直方向上的居中方式
          mainAxisSize: MainAxisSize.max,// 子组件在主轴上应占用的空间
          crossAxisAlignment: CrossAxisAlignment.stretch,// 次轴对齐方式 此处为水平方向上的对齐方式
          //textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.up, // 垂直方向上的起始位置，down:从上往下，up:从下往上
          children: <Widget>[
            Image.asset('assets/images/4.jpg',width: 50,height: 60,),
            Text('COLUMN'),
            Image.asset('assets/images/1.png',width: 50,height: 60,),
          ],
        ),
    );
  }
}





