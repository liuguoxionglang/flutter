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
        body: Center(
          child: Column(
            children: <Widget>[
              Card(
                // 子项
                child: Container(child: Text("data"),),
                // 颜色
                color: Colors.green,
                // 外边距
                margin: EdgeInsets.all(55),
                // z轴坐标  没卵用啊
                elevation: 55,
                // 形状
                shape:  Border.all(color: Colors.red),
                // 布尔型，好像也没卵用
                semanticContainer: false,
                clipBehavior: Clip.antiAliasWithSaveLayer,

              )
            ],
          ),
        ),
      ),
    );
  }
}