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
      appBar: AppBar(title: Text("singleChildScrollView"),),
      body:SingleChildScrollView( 
          scrollDirection:Axis.vertical,
          reverse: true,// 子项倒序排列
          padding: EdgeInsets.all(10),
          primary: true,// 设置为true,即使内容少，也有滚动效果
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 500,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  // A fixed-height child.
                  color: const Color(0xff808000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: const Color(0xff008000), // Green
                  height: 120.0,
                ),
              ],
            ),
          ),
        
        ),
    
    );
  } 
}







