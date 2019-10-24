import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

void main()=>runApp(BuzzingText());

 class BuzzingText extends StatefulWidget {
     @override
     _BuzzingTextState createState() => _BuzzingTextState();
   }
  
class _BuzzingTextState extends State<BuzzingText> {

  // LongPressGestureRecognizer _longPressRecognizer;
  
  //    @override
  //   void initState() {
  //      super.initState();
  //      _longPressRecognizer = LongPressGestureRecognizer()
  //        ..onLongPress = _handlePress;
  //    }
  
  //    @override
  //    void dispose() {
  //      _longPressRecognizer.dispose();
  //      super.dispose();
  //    }
  
  //    void _handlePress() {
  //      HapticFeedback.vibrate();
  //    }

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
              Text(
                'Hello, flutter! How are youdddddddddddd ddddddddfdfdf fdfsfddddddddddd dfsfd s?',// 要显示的字符串数据
                textAlign: TextAlign.center,//居中方式
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),//文本样式
                softWrap: true,// 按单词中断换行
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,// 文本缩放因子
                maxLines: 5,// 跨越的最大行数，若文本超出，则超出部分不显示

              ),
              
              RichText(
                // 文本内容组件
                text: TextSpan(
                  style: TextStyle(color: Colors.blue),//样式
                  text: "textspan..........text",//字符串文本
                  // 子组件数组（testspan）
                  children: [
                    TextSpan(text: "111111111"),
                    TextSpan(text: "22222222"),
                  ],
                  // 手势识别器
                  // recognizer: _longPressRecognizer
                ),
                // 对齐方式
                textAlign: TextAlign.center,
                //文本方向
                textDirection: TextDirection.ltr,
                // 软换行，按单词中断换行
                softWrap: true,
                //文本溢出处理
                overflow: TextOverflow.ellipsis,
                //文本缩放因子
                textScaleFactor: 2,
                maxLines: 15,//文本最大跨行数
              ),

              DefaultTextStyle(
                textAlign: TextAlign.start,//对齐方式
                softWrap: true,//是否换行，按单词中断换行
                overflow: TextOverflow.clip,//文本溢出处理
                maxLines: 5,//最大跨行数
                style: TextStyle(color: Colors.red),//样式，必须有
                //子部件项 必须有
                child: Container(
                  child: Text(
                    "大家好，我是朱志强！",
                    textDirection: TextDirection.ltr,
                  ),
                )
              )
              
            ],
          ),
        ),
      ),
    );
  }
}