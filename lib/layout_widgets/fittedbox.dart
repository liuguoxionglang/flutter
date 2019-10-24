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
             new Container(
              color: Colors.amberAccent,
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              // fittedbox
              child: new FittedBox(
                fit: BoxFit.fill,// 通过子项长宽比率来填充
                alignment: Alignment.center,// 居中
                // 子项
                child: new Container(
                  color: Colors.red,
                  child: new Text(
                    "BoxFit.fill",
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
           
        
          ],
        ),
      ),
    );
  }
}

