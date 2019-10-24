import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => new _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('样式。。。widget')
        ),
        body: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(border:Border.all(color: Colors.red) ),
          // padding会根据外层容器大小及 Padding的内边距，自适应其子部件
          child: Padding(
            padding: EdgeInsets.all(10.0),//内边距
            // 子部件
            child: Container(
              decoration: BoxDecoration(border:Border.all(color: Colors.red) ),
              child: Text('Hello World!')
            ),
          ),

        ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: 'Flutter Demo',
      home: new MyApp()
  ));
}