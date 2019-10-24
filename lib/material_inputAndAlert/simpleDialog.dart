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
         child: Column(
            children: <Widget>[
              SimpleDialog(
                title: const Text('Select assignment'),//标题
                titlePadding: EdgeInsets.fromLTRB(24, 24, 24, 24),//标题内边距
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),//子项内边距
                semanticLabel: "ddd",//语义化的标签  好像没作用？？
                shape:CircleBorder(side: BorderSide(color: Colors.red)),//弹框形状
                // 子项组件
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {  },
                    child: const Text('Treasury department'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {Navigator.pop(context, -1); },// 单击回调
                    child: const Text('State department'),//子项控件的内容
                  ),
                  Container(
                    child: Center(
                      child: Text("data"),
                    ),
                  )
                ],
              ),
             
             
           ],
         )
        
      )
    
    );
  }
}
