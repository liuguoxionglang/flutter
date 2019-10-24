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
       child: TextField(
          obscureText: false,// 是否为模糊文本,通常密码输入时设置为true
          focusNode: FocusNode(), //定义了此小部件的键盘焦点 ，应用没搞清楚
          textCapitalization: TextCapitalization.characters,// 每个字符大写
          //input装饰器
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          style: TextStyle(color: Colors.red),//样式
          textAlign: TextAlign.justify,//文本居中方式
          textDirection: TextDirection.rtl,// 文本方向，此处从右到左
          maxLength: 10,// 最大长度
          //值发生变化时的回调
          onChanged: (s){},
          cursorColor: Colors.green,//光标颜色
          onTap: (){},// 用户点击此文本字段时的回调函数
        )
      )
    
    );
  }
}
