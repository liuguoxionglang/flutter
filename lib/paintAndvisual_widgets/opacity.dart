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
      home:MyStateFulWidget(),
    );
  }
}
class MyStateFulWidget extends StatefulWidget {
  @override
  _MyStateFulWidget createState() => new _MyStateFulWidget();
}

class _MyStateFulWidget extends State<MyStateFulWidget> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: Container(
          child: Opacity(
            opacity: 0.9,// 透明度
            alwaysIncludeSemantics: true,
            // 子组件
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: (){},
                  child: Text("点击"),
                ),
                Text("文本text",style: TextStyle(color: Colors.lightGreen),)
              ],
            )

          ),
        )

    );
  }
}
