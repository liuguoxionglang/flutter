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
        child: Stack(
          // 作为模糊背景的组件放在前面
          children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   child: Image.asset("assets/images/4.jpg",width: 300, height: 300,),
              // ),
              // // 作为模糊背景的组件
              RaisedButton(onPressed: (){},child: Text("data"),),
             // 定义模糊效果
             BackdropFilter(
               // 过滤器，构建模糊效果
                filter: ui.ImageFilter.blur(sigmaX:1, sigmaY: 1),
                child: Container(
                  color: Colors.white.withAlpha(0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

