import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

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