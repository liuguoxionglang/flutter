import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

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
      home: ThemeTestRoute(),
    );
    // return WidgetsApp(
    //   color: Colors.red,
    //   home:   MediaQuery(
    //         data: MediaQueryData(
    //           size: Size(20, 50),
    //           textScaleFactor: 2
    //         ),
    //         child: Container(child: Text(".....data"),),
    //     ) ,
    //     builder: (BuildContext context, Widget child){
    //       return Text("fffffffffff");
    //     },
    // );
  }
}
class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: MediaQuery(
          data: MediaQueryData(
            size: Size(20, 50),
            devicePixelRatio: 5,//分辨率
            textScaleFactor: 2
          ),
          child: Container(child: Text("我是mediaquery"),),
        ),

    );
  }
}
