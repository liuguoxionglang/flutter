import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      home: new MaterialApp(
        home: new MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("SnackBar"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context) {
            return new RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      content: new Text("Snackbar"), //内容
                      action: new SnackBarAction(
                        label: "撤回",
                        onPressed: () {},
                      ), // 其他操作
                      backgroundColor:Colors.orange,//背景色
                      duration : Duration(microseconds: 500,minutes: 1), //  显示时长
                      //animation:,// 进出动画
                ));
              },
              child: new Text("点我啊"),
              color: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              disabledColor: Colors.lightBlueAccent,
            );
          }),
        ));
  }
}