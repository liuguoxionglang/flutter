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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const RaisedButton(
              onPressed: null,
              // 子组件内容
              child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
              disabledColor: Colors.red, // 按钮无法点击时的按钮颜色
              disabledTextColor: Colors.black,// 按钮无法点击时的文本颜色
              color: Colors.lightBlue, // button颜色
              //highlightColor: Colors.orange,// 点击后高亮颜色
              splashColor: Colors.green, // 点击时波动颜色
              colorBrightness: Brightness.light, // 颜色亮度
              elevation: 12,//z轴坐标 好像没卵用
              highlightElevation: 20,// 高亮时，z轴坐标  好像没卵用
              disabledElevation: 30, // 无法点击时z轴坐标
              // shape: CircleBorder(side:BorderSide(color: Colors.red) ),// button形状 ，此处设置圆形
              // clipBehavior: Clip.hardEdge,//剪切行为，没看出啥变化
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,//材料适配目标大小
              animationDuration: Duration(microseconds: 5000), // 动效时间  没看出啥效果着

            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              textColor: Colors.white,//文本颜色
              padding: const EdgeInsets.all(0.0), // 内边距
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('Gradient Button', style: TextStyle(fontSize: 20)),
              ),
              
            ),
          ],
        ),
      )
    
    );
  }
}
