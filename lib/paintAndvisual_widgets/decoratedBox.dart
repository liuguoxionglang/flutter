import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'dart:math';

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
        body: Center(
          child: Column(
            children: <Widget>[
              //装饰容器DecoratedBox
               DecoratedBox(
                // 装饰器，通常用boxdecoration
                decoration: BoxDecoration(
                    //线性背景颜色
                    gradient: LinearGradient(colors: [Colors.blue,Colors.yellow]),
                    //边框角度
                    borderRadius: BorderRadius.circular(30.0),
                    //阴影
                    boxShadow:[
                      BoxShadow(
                          //颜色
                          color: Colors.black,
                          //偏移量
                          offset: Offset(4.0, 4.0),
                          //模糊半径
                          blurRadius: 10.0
                      )
                    ]
                ),
                //在子组件的前面还是后面绘制此装饰
                position: DecorationPosition.background,// 设置到后面
                // 子组件
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("DecoratedBox",style: TextStyle(color: Colors.white),),
                ),
              ),
            
            ],
          ),
        )

    );
  }
}
