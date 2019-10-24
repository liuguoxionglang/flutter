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
              color: Colors.blue,
              height: 150.0,
              width: 150.0,
              //padding: const EdgeInsets.all(10.0),
              child: new FractionallySizedBox(
                alignment: Alignment.topLeft,// 坐上顶点对齐
                widthFactor: 0.5,// 0.5倍的宽
                heightFactor: 0.5,// 0.5倍的高
                // 子组件
                child: new Container(
                  color: Colors.red,
                ),
              ),
            )
         

            
           
        
          ],
        ),
      ),
    );
  }
}





