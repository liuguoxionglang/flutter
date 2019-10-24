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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("scrollable"),),
      body:ListView(
        children: <Widget>[
          Text("data",style: TextStyle(height: 20),),
          Text("data"),
          Text("data"),
          // 
          Scrollbar(
            child: RaisedButton(onPressed: (){},),
          ),
          Text("data"),
          Text("data"),
          Text("data"),
        ],
       
      ),
    );
  } 
}







