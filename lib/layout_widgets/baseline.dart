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
          new Baseline(
            baseline: 50.0,//// 此组件顶部开始放置子组件的逻辑像素数
            ///基线类型   对齐字母字符底部的水平线
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'TjTjTj',
              style: new TextStyle(
                fontSize: 16.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          new Baseline(
            baseline: 50.0,
            baselineType: TextBaseline.alphabetic,
            child: new Container(
              width: 30.0,
              height: 30.0,
              color: Colors.red,
            ),
          ),
          new Baseline(
            baseline: 50.0,
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'RyRyRy',
              style: new TextStyle(
                fontSize: 35.0,
              ),
            ),
          ),

            
           
        
          ],
        ),
      ),
    );
  }
}

