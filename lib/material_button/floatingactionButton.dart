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
      floatingActionButton: FloatingActionButton(
        tooltip: "提示",// 长按鼠标时提示内容
        onPressed: () {},//点击时的回调函数
        child: Icon(Icons.thumb_up),//子组件
        backgroundColor: Colors.pink,//背景色
        foregroundColor: Colors.black,// 文本或者图标颜色，即child组件的颜色
        // heroTag: Object(),
        mini:true ,// 是否迷你型，默认false
        // shape: CircleBorder(side: BorderSide(color: Colors.black)),//形状
        clipBehavior: Clip.antiAlias, //剪切行为，没看出啥变化
        materialTapTargetSize: MaterialTapTargetSize.padded, //材料适配目标大小
        isExtended:false ,// 是否继承父组件的相应属性， 个人理解，没看到啥效果

      ),
      body:Center(
        child: Text("FLOATINGACTIONBUTTON")
      )
    
    );
  }
}
