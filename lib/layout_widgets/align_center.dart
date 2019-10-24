import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

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
      appBar: AppBar(title: Text("customPainter"),),
      body: Center(
        child: Column(
          children: <Widget>[
           new Center(
             widthFactor: 1.2,// 宽度因子
             heightFactor: 2,// 高度因子
             // 子组件
             child: new Text("Center"),
            ),
            Align(
              // 对齐方式，1.0表示最右边的边，0表示中心 ，-1表示最左边的边 
              alignment: const Alignment(1.0, 0),
              widthFactor: 3.0, // 宽度因子
              heightFactor: 3.0,// 高度因子
              // 子组件
              child: new Container(
                child: new Text("Align"),
                color: Colors.amber,
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

