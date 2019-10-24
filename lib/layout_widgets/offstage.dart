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
  bool offstage;

  @override
  void initState() {
    super.initState();
    offstage = false;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("customPainter"),),
      body: Center(
        child: Column(
          children: <Widget>[
            new Offstage(
              offstage: offstage, // // 控制子组件的显示与隐藏，true为隐藏，false为显示
              child: Container(color: Colors.blue, height: 100.0),
            ),
            new CupertinoButton(
              child: Text("点击切换显示"),
              onPressed: () {
                setState(() {
                  offstage = !offstage;
                });
              },
            )
           

            
           
        
          ],
        ),
      ),
    );
  }
}





