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
        child: new Builder(
          builder: (BuildContext context) {
            return new RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: Text("提示"),
                      content: new Text("我是AlertDialog"),//弹框显示的内容
                      // //弹框中的操作组件，比如确认，取消等按钮操作
                      titlePadding: EdgeInsets.all(12),
                      contentPadding: EdgeInsets.all(2),
                      semanticLabel: "a",
                      // shape: ,
                      actions: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text('确定'))
                      ],
                  ));
                },
                child: new Text("Dialog出来"),
                color: Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                disabledColor: Colors.lightBlueAccent);
          }),
        
      )
    
    );
  }
}
