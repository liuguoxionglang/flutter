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
      appBar: AppBar(title: Text("list body"),),
      body: Container(
        width: 200.0,
        height: 100.0,
        color: Colors.yellow,
        child: CustomMultiChildLayout(
          delegate: TestLayoutDelegate(),//各子项尺寸、位置布局
          children: <Widget>[
            // 每一个子节点必须用一个LayoutId控件包裹起来
            LayoutId(
              id: TestLayoutDelegate.title,
              child: new Text("标题",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
            ),
            LayoutId(
              id: TestLayoutDelegate.description,
              child: new Text("子标题",
                  style: TextStyle(fontSize: 14.0, color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}

// 子项布局的控制方法
class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints =
        new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}




