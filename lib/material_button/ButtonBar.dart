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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child:ButtonBar(
          alignment: MainAxisAlignment.center, // 主轴方向居中显示
          mainAxisSize: MainAxisSize.max,// 主轴按容器最大显示
          // 子组件数组
          children: <Widget>[
           IconButton(
             icon: Icon(Icons.access_alarm),
             onPressed: (){},
           ),
           RaisedButton(
             onPressed: (){},
           )
          ],
        )
      )
    
    );
  }
}
