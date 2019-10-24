import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
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
      home:MyStatePage(),
    );
  }
}



class MyStatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStatePageState();
  }
}

class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Container(
        child:Table(
          // 设置列宽
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(50.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(50.0),
          },
          defaultColumnWidth: FlexColumnWidth(50),// 不起作用？？
          textDirection: TextDirection.rtl,//列从右到左排列
          // 网格线样式设置
          border: TableBorder.all(color: Colors.red, width: 1.0, style: BorderStyle.solid),
          defaultVerticalAlignment: TableCellVerticalAlignment.top,// 单元格内 垂直方向，文本顶部对齐
          children: const <TableRow>[
            TableRow(
              children: <Widget>[
                Text('A1',style: TextStyle(height: 20),),
                Text('B1'),
                Text('C1'),
                Text('D1'),
              ],
            ),
            TableRow(
              // 行 样式装饰
              decoration: BoxDecoration(color: Colors.red),
              // 单元格内容
              children: <Widget>[
                Text('A2'),
                Text('B2'),
                Text('C2'),
                Text('D2'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('A3'),
                Text('B3'),
                Text('C3'),
                Text('D3'),
              ],
            ),
          ],
          
        ),
      ),
    );
  }
}




