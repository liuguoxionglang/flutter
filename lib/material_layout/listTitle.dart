import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  var _callback = (){
    print(",,,,,,,,,,,,object");
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: Center(
          child: ListView(
            children: const <Widget>[
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),//头部小部件
                  title: Text('Three-line ListTile'),//标题部件
                  //子标题部件
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.fdsfdsfdsfdsfdsfdsfdffffffffffffffffffffffffffff'
                  ),
                  //尾部部件
                  trailing: Icon(Icons.more_vert),
                  // 是否自适应显示三行文本
                  isThreeLine: true,
                  // 标题和子标题内容是否密集显示
                  dense: true,
                  enabled: true,
                  // onTap: _callback,// 怎么会报错了？？
                  // onLongPress: _callback,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}