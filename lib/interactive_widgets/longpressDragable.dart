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

class MyStatePageState extends State<MyStatePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("longpressdragable"),),
      body: Center(
        child: LongPressDraggable(
          child: RaisedButton(child: Text("press"),),
          // 鼠标拖动时，所移动的组件对象
          feedback: Container(child: Text("feedback"),),
          onDragStarted: (){
            print("ondragstarted.....................");

          },
          onDraggableCanceled: (a,d){
            print("$a,,,,,,,,,,,,,,,,,,,,,,,,,,,,$d,,,,,,ondraggablecanceled");
          },
          onDragCompleted: (){
            print("ondragcompleted.............");
          },
          onDragEnd: (e){
            print("$e................ondragend");
          },
          data: Text("data..."),//没看到啥变化
          // 拖动时  替换原child组件
          childWhenDragging: Text("childwhenDragging"),
        ),
      ),
    );
  }

}










