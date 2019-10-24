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
            new IntrinsicHeight(
              // 子组件
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // 子组件的高度，自动增加到与下面黄色container同高
                children: <Widget>[
                  new Container(color: Colors.blue, width: 100.0),
                  new Container(color: Colors.red, width: 50.0,height: 50.0,),
                  new Container(color: Colors.yellow, width: 150.0,height: 100,),
                ],
              ),
            ),
            Divider(height: 10,color: Colors.black,),

            new IntrinsicWidth(
              stepHeight: 50.0,
              stepWidth: 40.0, // 子组件的宽度是此值得n倍，此处为4倍，也就是160，因此。蓝色、黄色container的宽度就会自适应到160
              child: new Column(
                children: <Widget>[
                  new Container(color: Colors.blue, height: 100.0),
                  new Container(color: Colors.red, width: 130.0, height: 100.0),
                  new Container(color: Colors.yellow, height: 150.0,),
                ],
              ),
            )
            

            
           
        
          ],
        ),
      ),
    );
  }
}





