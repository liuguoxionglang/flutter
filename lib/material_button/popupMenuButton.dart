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
  var _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          // 弹出菜单按钮
          PopupMenuButton(
            initialValue: _selectedValue,// 初始选中的子项的value值
            offset:Offset(200,100) ,// x y轴便宜，x轴200，y轴100,x轴似乎没有起作用？
            tooltip: "长按提示",// 长按提示
            icon: Icon(Icons.more_vert),//按钮图标，默认三个竖排小圆点
            // 关闭时的回调函数
            onCanceled: (){

            },
            // 选中时的回调函数
            onSelected: (result){
              setState(() {
                _selectedValue = result;
              });
            },
            // 创建每个子项
            itemBuilder: (BuildContext context)=><PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text("音乐"),
              ),
              const PopupMenuItem(
                value: 2,//子项的值
                enabled: false,// 是否可用,默认true
                height: 100,// 每个子项高度
                child: Text("音乐"),// 子项内容
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("音乐"),
              ),
            ],
            // child: Text("data"),// 与icon不能共存
          )
        ],
      ),
      body:Center(
        child:Text("popupMenuButton")
      )
    
    );
  }
}
