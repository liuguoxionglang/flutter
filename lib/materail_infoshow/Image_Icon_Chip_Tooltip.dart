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
              new Image.network(
                'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
                // 缩放比例
                scale: 6.0,
              ),
              new Image.asset("assets/images/2.jpg"),
              Icon(
                Icons.ac_unit,
                color: Colors.blue,//图标颜色
                size: 30,//图标大小
                semanticLabel: "icon演示",//语义化标签,好像没卵用？？
                textDirection: TextDirection.ltr,// 文本方向
                
              ),
              Chip(
                // 通常将头像，图片之类的信息放在此widget中
                avatar:  CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('AB'),
                ),
                label: Text('chip label'),//标签
                labelStyle: TextStyle(color: Colors.red),//标签样式
                deleteIcon: Icon(Icons.add),//当onDeleted回调函数被设置时，添加此图标
                onDeleted: (){
                  print("ondeleted..............");
                },// 回调函数，点击deleteIcon时的回调
                deleteIconColor: Colors.green,//deleteIcon的颜色
                deleteButtonTooltipMessage: "aaaa",//长按删除button的提示信息
                backgroundColor: Colors.greenAccent,//背景色
              ),

              Tooltip(
                message: "提示信息",//长按提示框中的内容
                height: 50,// 此提示框的高
                padding: EdgeInsets.all(12),//提示框的内边距
                verticalOffset:60,//提示框距离小部件的垂直偏移 此处向下偏移60
                preferBelow: true,//提示是否默认显示在小部件下面
                excludeFromSemantics: true,//是否从语义树中排出提示信息
                child: Text("data"),// 长按的小部件
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}