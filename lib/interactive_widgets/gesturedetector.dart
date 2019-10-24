import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:math';

import 'dart:async';
import 'dart:ui';

import 'package:flutter/rendering.dart';






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

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _operation = "No Gesture detected!"; 


    //更新文本
  void updateText(String text) {
    setState(() {
      _operation = text;
    });
    //提示
    showSnackBar(text);
  }

  // 底部弹层显示信息
  void showSnackBar(String message) {
    var snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.lightGreen,
        duration: Duration(milliseconds: 400));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("GestureDetectorTest"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
            child: Text(
              _operation,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
          ),
          onTap: () => updateText("onTap"), //单击
          onDoubleTap: () => updateText("onDoubleTap"), //双击
          onLongPress: () => updateText("onLongPress"), //长按
          // onTapDown: (e){
          //   print("tapdown....................");
          // },
          // onVerticalDragDown: (e){
          //   print("VerticalDragDown....................");
          // },
          // onPanDown: (e){
          //    print("pandown....................");
          // },
        ),
      ),
    );
  }

}










