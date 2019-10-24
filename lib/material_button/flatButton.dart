import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body:Center(
        child:Column(
          children:  <Widget>[
           FlatButton(
            color: Colors.blue,// 按钮颜色
            splashColor: Colors.blueAccent,//点击波动效果的颜色
            onPressed: () {},//回调函数
            //子组件
            child: Text(
              "Flat Button",
              style: TextStyle(fontSize: 20.0),
            ),
          )
          ],
        )
      )
    
    );
  }
}
