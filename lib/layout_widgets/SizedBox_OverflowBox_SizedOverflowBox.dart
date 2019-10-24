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
      appBar: AppBar(title: Text("customPainter"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: 100.0,// 设置此值后，子组件设置的宽度无效
                height: 100.0,// 设置此值后，子组件设置的高度无效
                child: Container(
                  color: Colors.red,
                  width: 50.0,
                  height: 150.0,
                ),
              )
            ),
            Divider(height: 15,color: Colors.black,),
            Container(
              color: Colors.green,
              width: 100.0,
              height: 100.0,
              padding: const EdgeInsets.all(5.0),
              // overflowBox包裹的子组件可以溢出容器container
              child: OverflowBox(
                alignment: Alignment.topLeft,// 坐上角对齐
                maxWidth: 150.0, // 最大宽度
                maxHeight: 150.0,// 最大高度
                minWidth: 125.0, // 最小宽度
                minHeight: 125.0,// 最小高度
                // 设置最大最小高度和宽度之后，子组件设置的宽度，高度无效了，小于最小按最小，大于最大按最大
                child: Container(
                  color: Colors.grey,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Divider(height: 50,color: Colors.black,),
            Container(
              color: Colors.green,
              alignment: Alignment.topRight,
              width: 100.0,
              height: 100.0,
              padding: EdgeInsets.all(5.0),
              // 没弄明白？？
              child: SizedOverflowBox(
                size: Size(50.0, 100.0),// 设置width 50 高100
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.red, 
                  width: 100.0, 
                  height: 50.0,
                ),
              ),
            ),
           
           

            

          ],
        ),
      ),
    );
  }
}





