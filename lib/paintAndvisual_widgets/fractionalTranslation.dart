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
             Container(
              //  width: 100,
              //  height: 100,
              //  color: Colors.black,
               child:  FractionalTranslation(
                // 子对象
                child: RaisedButton(onPressed: (){},child: Text("data"),),
                //将子对象，向右移动组件宽度的1倍，向下移动组件高度的1倍
                translation: Offset(1, 1),
                transformHitTests: true,
                
               ),
              )
            ],
          ),
        )

    );
  }
}
