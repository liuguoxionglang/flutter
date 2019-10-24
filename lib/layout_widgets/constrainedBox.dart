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
            new ConstrainedBox(
              // 约束条件  限制的最小、最大长度和宽度
              constraints: const BoxConstraints(
                minWidth: 50.0,
                minHeight: 50.0,
                maxWidth: 150.0,
                maxHeight: 150.0,
              ),
              // 子组件
              child: new Container(
                width: 20.0,
                height: 20.0,
                color: Colors.green,
              ),
            )
           
        
          ],
        ),
      ),
    );
  }
}

