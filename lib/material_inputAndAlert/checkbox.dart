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
        child:Column(
          children: <Widget>[
            Checkbox(
              value: false,//复选框的值，true为选中，false为未选中
              tristate: true,
              onChanged: (a){},//选中变化时的回调
              activeColor: Colors.red,//// 选中时填充的颜色
            ),
            Radio(
              value: 1,//单元框的值，
              groupValue: 2,// 单选按钮组的选定值 当此值与value值相同时，则此单选按钮被选中
              onChanged: (val){},// 选中变化时的回调
              activeColor: Colors.green,//选中时的填充颜色
            ),
            Switch(
              value: false,//复选框的值，true为选中，false为未选中 不能为null
              onChanged: (val){},//选中变化时的回调
              activeColor: Colors.greenAccent,//选中时圆形球球的颜色
              activeTrackColor: Colors.lightBlue,//选中时球球轨道的颜色
              inactiveTrackColor: Colors.black,//取消选中时的轨道颜色
              inactiveThumbColor: Colors.red,//未选中时的球球颜色

            ),
            Slider(
              value: 0.1,// 滑动块的值，double类型
              onChanged: (val){
                print("111......................"+val.toString());
              },
              onChangeStart: (val){
                print("start...................."+val.toString());
              },
              onChangeEnd: (val){
                print("end......................."+val.toString());
              },
              divisions: 1,
              label: "aa",//滑动块提示标签
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              semanticFormatterCallback: (val){
                return '${val.round()} .............dollars';
              },

            )
          ],
        )
        
      )
    
    );
  }
}
