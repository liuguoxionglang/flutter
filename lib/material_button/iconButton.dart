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
        actions: <Widget>[
          new IconButton( // action button
            icon: new Icon(Icons.add_a_photo),//图标
            // 点击回调函数
            onPressed: () { 
              setState(() {
                              
              });

            },
            iconSize: 20,// 图标大小
            alignment:Alignment.bottomRight,//居中方式
            color: Colors.black,//颜色
            highlightColor: Colors.orange,//高亮颜色
            
          ),
          new IconButton( // action button
            icon: new Icon(Icons.add_alarm),
            onPressed: () { },
          ),
        ],
      
      ),
      body:Center(
        child:Text("IconButton")
      )
    
    );
  }
}
