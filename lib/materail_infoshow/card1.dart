import 'package:flutter/material.dart';
void main()=>runApp(new Myapp());



class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'borderPractice',
      theme:ThemeData(

      ),
      home: new CardTest(),
    );
  }

}

//
class CardTest  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // card的相关参数
    return Card(
      //color: Colors.blue,
      // 没看出作用
      elevation: -25,
      // box形状
      shape: Border.all(color: Colors.red),
      // 外边距
      margin: const EdgeInsets.all(20),
      // 剪切行为，没看出作用
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // 语意容器，没看出
      semanticContainer: false,
      //列的相关参数
      child: Column(
        // 主轴方向的对齐方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //主轴大小设置
        mainAxisSize: MainAxisSize.min,
        // 纵轴方向对齐方式
        crossAxisAlignment: CrossAxisAlignment.end,
        //文字方向 左到右，右到左
        textDirection: TextDirection.rtl,
        // 垂直方向 的排列
        verticalDirection: VerticalDirection.down,
        // 文本基线
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          const ListTile(
            // 头 组件
            leading: Icon(Icons.add),
            // 标题
            title: Text('The Enchanted Nightingale'),
            // 子标题
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            // 尾部
            trailing:Text('ddd'),
            // 显示行数控制
            isThreeLine:false,
            // 文字显示
            dense: false,
            // 内容内边距
            contentPadding:EdgeInsets.all(2),
            // 是否可编辑的样式
            enabled: true,
            //onTap: (val)=>{},
            //onLongPress: ,
            // 时候选中的样式
            selected: false,

          ),
          ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar( // 水平放置
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  //onHighlightChanged:不知道
                  child: const Text('BUY TICKETS'),
                  onPressed: () { /* ... */ },
                  textColor: Colors.red,
                  // 按钮文字主题  没看出区别
                  textTheme: ButtonTextTheme.normal,
                  color: Colors.blue,
                  disabledColor: Colors.tealAccent,
                  // 点击后的高亮颜色
                  highlightColor: Colors.green,
                  // 点击时的波动效果颜色
                  splashColor: Colors.amber,
                  // 色彩亮度
                  colorBrightness: Brightness.dark,
                  padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
                  shape: Border.all(color: Colors.red),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () { /* ... */ },
                ),
                RaisedButton(
                  child: new Text('raisedButton'),
                  //elevation:12,
                  //highlightElevation:15,
                  disabledElevation:20,
                  
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

}