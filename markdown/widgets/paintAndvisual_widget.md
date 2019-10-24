# flutter widget组件之-----------绘制和视觉效果组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## opacity
> 使其子widget透明的widget。
- 构造函数
```javascript
Opacity({
    Key key,
    @required this.opacity,// 透明度
    this.alwaysIncludeSemantics = false,//是否始终包含子widget的语义信息
    Widget child,// 子组件
  })
``` 
- 应用示例
```javascript
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

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
        body: Container(
          child: Opacity(
            opacity: 0.9,// 透明度
            alwaysIncludeSemantics: true,
            // 子组件
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: (){},
                  child: Text("点击"),
                ),
                Text("文本text",style: TextStyle(color: Colors.lightGreen),)
              ],
            )

          ),
        )

    );
  }
}


```
## transform
> 在绘制子widget之前应用转换的widget
- 构造函数
```javascript
Transform({
    Key key,
    @required this.transform,//必须，一个4x4的矩阵。不难发现，其他平台的变换矩阵也都是四阶的。一些复合操作，仅靠三维是不够的，必须采用额外的一维来补充，感兴趣的同学可以自行搜索了解
    this.origin,//旋转参考点，默认旋转点事左上角顶点
    this.alignment,//对齐方式
    this.transformHitTests = true,// 点击区域是否要做响应的改变
    Widget child,// 子组件
  }) 
  Transform.rotate({
    Key key,
    @required double angle,// 弧度
    this.origin,
    this.alignment = Alignment.center,
    this.transformHitTests = true,
    Widget child,
  }) 
  Transform.translate({
    Key key,
    @required Offset offset,//偏移量
    this.transformHitTests = true,
    Widget child,
  })
  Transform.scale({
    Key key,
    @required double scale,//缩放级别
    this.origin,
    this.alignment = Alignment.center,
    this.transformHitTests = true,
    Widget child,
  })
``` 
- 应用示例
```javascript
class _MyStateFulWidget extends State<MyStateFulWidget> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight,// 对齐方式
                  origin:Offset(0,5) ,//旋转参考点
                  transform: Matrix4.skewY(0.3)..rotateZ(30),//转换矩阵
                  //要转换的组件
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: const Color(0xFFE8581C),
                    child: const Text('Apartment for rent!'),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}


```
## fractionalTranslation
> 绘制盒子之前给其添加一个偏移转换
- 构造函数
```javascript
FractionalTranslation({
    Key key,
    @required this.translation,//应用于子对象的转换， Offset对象
    this.transformHitTests = true,// 点击区域是否要做响应的改变
    Widget child, // 子组件
  })

``` 
- 应用示例
```javascript
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

```
## DecoratedBox
> 在孩子绘制之前或之后绘制装饰的widget
- 构造函数
```javascript
DecoratedBox({
    Key key,
    @required this.decoration,// 装饰器，通常用boxdecoration
    this.position = DecorationPosition.background,//在子组件的前面还是后面绘制此装饰
    Widget child// 子组件
})
``` 
- 应用示例
```javascript
class _MyStateFulWidget extends State<MyStateFulWidget> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: Center(
          child: Column(
            children: <Widget>[
              //装饰容器DecoratedBox
               DecoratedBox(
                // 装饰器，通常用boxdecoration
                decoration: BoxDecoration(
                    //线性背景颜色
                    gradient: LinearGradient(colors: [Colors.blue,Colors.yellow]),
                    //边框角度
                    borderRadius: BorderRadius.circular(30.0),
                    //阴影
                    boxShadow:[
                      BoxShadow(
                          //颜色
                          color: Colors.black,
                          //偏移量
                          offset: Offset(4.0, 4.0),
                          //模糊半径
                          blurRadius: 10.0
                      )
                    ]
                ),
                //在子组件的前面还是后面绘制此装饰
                position: DecorationPosition.background,// 设置到后面
                // 子组件
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("DecoratedBox",style: TextStyle(color: Colors.white),),
                ),
              ),
            
            ],
          ),
        )

    );
  }
}

```
## RotatedBox
> 可以延顺时针以90度的倍数旋转其子widget
- 构造函数
```javascript
RotatedBox({
    Key key,
    @required this.quarterTurns,//子组件应该顺时针旋转的的次数，每次1/4圈
    Widget child,// 子组件
  })
``` 
- 应用示例
```javascript
class _MyStateFulWidget extends State<MyStateFulWidget> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: Center(
          child: Column(
            children: <Widget>[
              RotatedBox(
                // 子组件
                child: RaisedButton(onPressed: (){},child: Text("旋转"),),
                //旋转1/4圈的次数
                quarterTurns: 3,
              )
            ],
          ),
        )

    );
  }
}
```
## ClipOval ClipPath ClipRect ClipRRect
> ClipOval: 圆形裁剪，用椭圆剪辑其孩子的widget
> ClipPath: 路径裁剪，用path剪辑其孩子的widget
> ClipRect：矩形裁剪，用矩形剪辑其孩子的widget
> ClipRRect:圆角矩形裁剪
- 构造函数
```javascript
ClipOval({ 
    Key key, 
    this.clipper,// 裁剪路径
    this.clipBehavior = Clip.antiAlias, //裁剪行为
    Widget child // 子组件
})
ClipPath({ 
    Key key, 
    this.clipper, 
    this.clipBehavior = Clip.antiAlias, 
    Widget child 
})
 ClipRect({ 
    Key key, 
    this.clipper, 
    this.clipBehavior = Clip.hardEdge, 
    Widget child 
})
const ClipRRect({
    Key key,
    this.borderRadius,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
    Widget child,
  })

``` 
- 应用示例
```javascript
class _MyStateFulWidget extends State<MyStateFulWidget> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: Center(
          child: Column(
            children: <Widget>[
              //圆形裁剪
              ClipOval(
                // clipper: ,
                child:new SizedBox(
                  width: 100.0,
                  height:100.0,
                  child:  new Image.asset("assets/images/3.jpg",fit: BoxFit.fill,),
                ),
              ),
              Divider(color: Colors.red,height: 2,),
              // 按路径裁剪，自定义了裁剪路径
              ClipPath(
                child:new SizedBox(
                  width: 100.0,
                  height:100.0,
                  child:  new Image.asset("assets/images/4.jpg",fit: BoxFit.fill,),
                ),
                // 自定义五角星裁剪路径
                clipper:new _StarCliper(radius: 50.0) ,
              ),
              Divider(color: Colors.red,height: 2,),
              // 圆角矩形裁剪
              ClipRRect(
                 borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                 child:new SizedBox(
                  width: 100.0,
                  height:100.0,
                  child:  new Image.asset("assets/images/3.jpg",fit: BoxFit.fill,),
                ),
              ),
              Divider(color: Colors.red,height: 2,),
              //方角矩形裁剪 ，自定义了裁剪路径
              ClipRect(
                child:new SizedBox(
                  width: 100.0,
                  height:100.0,
                  child:  new Image.asset("assets/images/4.jpg",fit: BoxFit.fill,),
                ),
                clipper: new _MyClipper(),
              )
            ],
          ),
        )

    );
  }
}

// 自定义裁剪器
class _MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(10.0, 10.0, size.width - 10.0,  size.height- 10.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
      return true;
  }

}
// 五角星路径
class _StarCliper extends CustomClipper<Path>{

  final double radius;

  _StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36);// 36为五角星的角度
    double radius_in = (radius * Math.sin(radian / 2) / Math
        .cos(radian)); // 中间五边形的半径

    path.moveTo((radius * Math.cos(radian / 2)), 0.0);// 此点为多边形的起点
    path.lineTo((radius * Math.cos(radian / 2) + radius_in
        * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius_in
        * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) + radius
            * Math.sin(radian)), (radius + radius
        * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)),
        (radius + radius_in));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radius
            * Math.sin(radian)), (radius + radius
        * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in
        * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in
        * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));

    path.close();// 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(_StarCliper oldClipper) {
      return this.radius != oldClipper.radius;
  }

}
```
## customPaint
> 提供一个画布的widget，在绘制阶段可以在画布上绘制自定义图形
- 构造函数
```javascript
CustomPaint({
    Key key,
    this.painter,// 绘制主体的绘制工具
    this.foregroundPainter,// 绘制前景的绘制工具
    this.size = Size.zero,// 画布大小
    this.isComplex = false,// 是否要用到缓冲
    this.willChange = false,// 是否应告知光栅缓存此绘制可能在下一帧中更改。
    Widget child,// 子组件，通常不用，一般都得不到想要的子组件
  })

``` 
- 应用示例
```javascript
mport 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

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
      home:ClockPage(),
    );
  }
}



class ClockPage extends StatefulWidget {
  final double radius;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color numberColor;
  final Color borderColor;

  const ClockPage(
      {Key key,
      this.hourHandColor,
      this.minuteHandColor,
      this.secondHandColor,
      this.numberColor,
      this.borderColor,
      this.radius = 150.0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ClockPageState();
  }
}

class ClockPageState extends State<ClockPage> {
  DateTime datetime;
  Timer timer;

  @override
  void initState() {
    super.initState();
    datetime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        datetime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("customPainter"),),
      body: CustomPaint(
        // 绘制主体的绘制工具
        painter: ClockPainter(
            datetime,
            numberColor: Colors.black,
            handColor: Colors.black,
            borderColor: Colors.black,
            radius: widget.radius
          ),
        //画布大小
        size: Size(widget.radius * 2, widget.radius * 2),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final double radius;
  List<Offset> secondsOffset = [];
  final DateTime datetime;
  TextPainter textPainter;
  double angle;
  double borderWidth;

  ClockPainter(this.datetime,
      {this.radius = 150.0,
      this.handColor = Colors.black,
      this.numberColor = Colors.black,
      this.borderColor = Colors.black}) {
        
    borderWidth = radius / 14;
    final secondDistance = radius - borderWidth * 2;
    //init seconds offset
    for (var i = 0; i < 60; i++) {
      Offset offset = Offset(
          cos(degToRad(6 * i - 90)) * secondDistance + radius,
          sin(degToRad(6 * i - 90)) * secondDistance + radius);
      secondsOffset.add(offset);
    }

    textPainter = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    angle = degToRad(360 / 60);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scale = radius / 150;

    //draw border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawCircle(
        Offset(radius, radius), radius - borderWidth / 2, borderPaint);

    //draw second point
    final secondPPaint = Paint()
      ..strokeWidth = 2 * scale
      ..color = numberColor;
    if (secondsOffset.length > 0) {
      canvas.drawPoints(PointMode.points, secondsOffset, secondPPaint);

      canvas.save();
      canvas.translate(radius, radius);

      List<Offset> bigger = [];
      for (var i = 0; i < secondsOffset.length; i++) {
        if (i % 5 == 0) {
          bigger.add(secondsOffset[i]);

          //draw number
          canvas.save();
          canvas.translate(0.0, -radius + borderWidth * 4);
          textPainter.text = new TextSpan(
            text: "${(i ~/ 5) == 0 ? "12" : (i ~/ 5)}",
            style: TextStyle(
              color: numberColor,
              fontFamily: 'Times New Roman',
              fontSize: 28.0 * scale,
            ),
          );

          //helps make the text painted vertically
          canvas.rotate(-angle * i);

          textPainter.layout();
          textPainter.paint(canvas,
              new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
          canvas.restore();
        }
        canvas.rotate(angle);
      }
      canvas.restore();

      final biggerPaint = Paint()
        ..strokeWidth = 5 * scale
        ..color = numberColor;
      canvas.drawPoints(PointMode.points, bigger, biggerPaint);
    }

    final hour = datetime.hour;
    final minute = datetime.minute;
    final second = datetime.second;

    // draw hour hand
    Offset hourHand1 = Offset(
        radius - cos(degToRad(360 / 12 * hour - 90)) * (radius * 0.2),
        radius - sin(degToRad(360 / 12 * hour - 90)) * (radius * 0.2));
    Offset hourHand2 = Offset(
        radius + cos(degToRad(360 / 12 * hour - 90)) * (radius * 0.5),
        radius + sin(degToRad(360 / 12 * hour - 90)) * (radius * 0.5));
    final hourPaint = Paint()
      ..color = handColor
      ..strokeWidth = 8 * scale;
    canvas.drawLine(hourHand1, hourHand2, hourPaint);

    // draw minute hand
    Offset minuteHand1 = Offset(
        radius - cos(degToRad(360 / 60 * minute - 90)) * (radius * 0.3),
        radius - sin(degToRad(360 / 60 * minute - 90)) * (radius * 0.3));
    Offset minuteHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * minute - 90)) * (radius - borderWidth * 3),
        radius +
            sin(degToRad(360 / 60 * minute - 90)) * (radius - borderWidth * 3));
    final minutePaint = Paint()
      ..color = handColor
      ..strokeWidth = 3 * scale;
    canvas.drawLine(minuteHand1, minuteHand2, minutePaint);

    // draw second hand
    Offset secondHand1 = Offset(
        radius - cos(degToRad(360 / 60 * second - 90)) * (radius * 0.3),
        radius - sin(degToRad(360 / 60 * second - 90)) * (radius * 0.3));
    Offset secondHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * second - 90)) * (radius - borderWidth * 3),
        radius +
            sin(degToRad(360 / 60 * second - 90)) * (radius - borderWidth * 3));
    final secondPaint = Paint()
      ..color = handColor
      ..strokeWidth = 1 * scale;
    canvas.drawLine(secondHand1, secondHand2, secondPaint);

    final centerPaint = Paint()
      ..strokeWidth = 2 * scale
      ..style = PaintingStyle.stroke
      ..color = Colors.yellow;
    canvas.drawCircle(Offset(radius, radius), 4 * scale, centerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);

```
## backDropFilter
> 一个widget，它将过滤器应用到现有的绘图内容，然后绘制孩子。这种效果是比较昂贵的，尤其是如果过滤器是non-local，如blur.
> BackdropFilter不是变换背景来实现高斯模糊的效果，而是通过在背景上面盖上一个模糊层从而达到高斯模糊的效果，因此要做模糊的组件必须要在BackdropFilter底下，通常用Stack来控制布局的层次摆放
- 构造函数
```javascript
 BackdropFilter({
    Key key,
    @required this.filter,// 过滤器，构建模糊效果
    Widget child
  }) 

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("customPainter"),),
      body: Center(
        child: Stack(
          // 作为模糊背景的组件放在前面
          children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   child: Image.asset("assets/images/4.jpg",width: 300, height: 300,),
              // ),
              // // 作为模糊背景的组件
              RaisedButton(onPressed: (){},child: Text("data"),),
             // 定义模糊效果
             BackdropFilter(
               // 过滤器，构建模糊效果
                filter: ui.ImageFilter.blur(sigmaX:1, sigmaY: 1),
                child: Container(
                  color: Colors.white.withAlpha(0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

```
