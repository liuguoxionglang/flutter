# flutter  widget组件之-----------文本组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## Text
> 单一格式的文本
- 构造函数
```javascript
Text(
    this.data, // 要显示的字符串数据
    {
        Key key,
        this.style,//文本样式
        this.textAlign,//居中方式
        this.textDirection,//文本方向
        this.locale,//
        this.softWrap,//文本是否应在软换行处断开
        this.overflow,//溢出处理
        this.textScaleFactor,// 文本缩放因子
        this.maxLines,//文本要跨越的可选最大跨行
        this.semanticsLabel,//语义化标签
    }
)
 
``` 
- 应用示例
```javascript
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
              Text(
                'Hello, flutter! How are youdddddddddddd ddddddddfdfdf fdfsfddddddddddd dfsfd s?',// 要显示的字符串数据
                textAlign: TextAlign.center,//居中方式
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),//文本样式
                softWrap: true,// 按单词中断换行
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,// 文本缩放因子
                maxLines: 5,// 跨越的最大行数，若文本超出，则超出部分不显示

              )
            ],
          ),
        ),
      ),
    );
  }
}


```
## RichText
> 一个富文本Text，可以显示多种样式的text
- 构造函数
```javascript
RichText({
    Key key,
    @required this.text,// 文本内容组件
    this.textAlign = TextAlign.start,// 对齐方式
    this.textDirection,//文本方向
    this.softWrap = true,// 软换行，按单词中断换行
    this.overflow = TextOverflow.clip,//文本溢出处理
    this.textScaleFactor = 1.0,//文本缩放因子
    this.maxLines,//文本最大跨行数
    this.locale,
  })
  TextSpan({
    this.style,//样式
    this.text,//字符串文本
    this.children,// 子组件数组（testspan）
    this.recognizer,//一个手势识别器，它将接收命中此文本范围的事件。
  })
 
``` 
- 应用示例
```javascript
/*此处省略同上相同的部分代码*/
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

              // DefaultTextStyle()
            ],
          ),
        ),
      ),
    );
  }
}


```
## DefaultTextStyle
> 文字样式，用于指定Text widget的文字样式
- 构造函数
```javascript
DefaultTextStyle({
    Key key,
    @required this.style,//样式
    this.textAlign,//对齐方式
    this.softWrap = true,//是否换行，按单词中断换行
    this.overflow = TextOverflow.clip,//文本溢出处理
    this.maxLines,//最大跨行数
    @required Widget child,//子部件项
  })
 
``` 
- 应用示例
```javascript
/*省略部分同上相同的部分代码*/
class _BuzzingTextState extends State<BuzzingText> {
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


```
