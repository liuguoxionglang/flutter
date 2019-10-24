import 'package:flutter/material.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.6,// 指示器的进度值
              backgroundColor: Colors.greenAccent,//轨道背景颜色
              semanticsLabel: "60%",
              semanticsValue: "6",
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),// 进图条动画颜色
              // valueColor: CurvedAnimation(),
            ),
            Text("圆形指示器"),
            CircularProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.black,// 背景色没有起作用？？
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)
            ),

          ],
        ),
      ),
    );
  }
}