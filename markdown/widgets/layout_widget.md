# flutter widget组件之-----------布局组件(单个子元素)
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## Container
> 一个拥有绘制、定位、调整大小的 widget
- 构造函数
```javascript
Container({
    Key key,
    this.alignment,// 对齐方式
    this.padding,// 内边距
    Color color,// 背景色
    Decoration decoration,// 主体内容装饰器
    this.foregroundDecoration,// 前景装饰器
    double width,// 容器宽
    double height,// 容器高
    BoxConstraints constraints,// 应用于子组件的条件约束
    this.margin,// 外边距
    this.transform,// 转换
    this.child,// 子组件
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
        child: Column(
          
          children: <Widget>[
            new Container(
              // color: Colors.red, // 装饰器的简单写，与装饰器不能共存
              // 条件约束，
              constraints: new BoxConstraints.expand(
                height:
                    Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              // 装饰器 给容器添加的样式
              decoration: new BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.grey,
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                image: new DecorationImage(
                  image: new NetworkImage(
                      'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                ),
              ),
              padding: const EdgeInsets.all(8.0),// 内边距 都为8
              alignment: Alignment.center,// 居中对齐
              // 子组件 
              child: new Text('Hello World',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.black)),
              // 绕着z轴旋转 多少弧度
              transform: new Matrix4.rotationZ(0.3),
          ),
        
          ],
        ),
      ),
    );
  }
}

```
## Padding
> 一个widget, 会给其子widget添加指定的填充
- 构造函数
```javascript
Padding({
    Key key,
    @required this.padding,// 内边距
    Widget child,// 子组件
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
        child: Column(
          children: <Widget>[
            new Padding(
              // 内边距
              padding: const EdgeInsets.fromLTRB(20.0, 50.0, 40.0, 40.0),
              // 子组件
              child: new Text("Padding"),
            )
        
          ],
        ),
      ),
    );
  }
}

```
## Center Align
> Align:一个widget，它可以将其子widget对齐，并可以根据子widget的大小自动调整大小。
> Center:将其子widget居中显示在自身内部的widget,继承了Align
- 构造函数
```javascript
Align({
    Key key,
    this.alignment = Alignment.center,// 对齐方式
    this.widthFactor,//大于等于1.0的正数，用于计算此组件的宽度，子组件的宽度乘以此宽度因子
    this.heightFactor,//大于等于1.0的正数，用于计算此组件的高度，子组件的宽度乘以此高度因子
    Widget child // 子组件
  })
Center({ 
  Key key, 
  double widthFactor, //大于等于1.0的正数，用于计算此组件的宽度，子组件的宽度乘以此宽度因子
  double heightFactor, //大于等于1.0的正数，用于计算此组件的高度，子组件的宽度乘以此高度因子
  Widget child // 子组件
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
        child: Column(
          children: <Widget>[
           new Center(
             widthFactor: 1.2,// 宽度因子
             heightFactor: 2,// 高度因子
             // 子组件
             child: new Text("Center"),
            ),
            Align(
              // 对齐方式，1.0表示最右边的边，0表示中心 ，-1表示最左边的边 
              alignment: const Alignment(1.0, 0),
              widthFactor: 3.0, // 宽度因子
              heightFactor: 3.0,// 高度因子
              // 子组件
              child: new Container(
                child: new Text("Align"),
                color: Colors.amber,
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

```
## FittedBox
> 按自己的大小调整其子widget的大小和位置。
- 构造函数
```javascript
 FittedBox({
    Key key,
    this.fit = BoxFit.contain,// 子项如何填充布局空间， contain cover等
    this.alignment = Alignment.center,// 对齐方式
    Widget child,//子项
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
        child: Column(
          children: <Widget>[
             new Container(
              color: Colors.amberAccent,
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              // fittedbox
              child: new FittedBox(
                fit: BoxFit.fill,// 通过子项长宽比率来填充
                alignment: Alignment.center,// 居中
                // 子项
                child: new Container(
                  color: Colors.red,
                  child: new Text(
                    "BoxFit.fill",
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
           
        
          ],
        ),
      ),
    );
  }
}

```
## AspectRatio
> 一个widget，试图将子widget的大小指定为某个特定的长宽比。
- 构造函数
```javascript
 AspectRatio({
    Key key,
    @required this.aspectRatio, // 长宽比率，不能为空
    Widget child // 子组件
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
        child: Column(
          children: <Widget>[
            new Container(
              height: 200.0,
              // aspectRatio布局  
              child: new AspectRatio(
                aspectRatio: 2,// 长款比率
                //子组件
                child: new Container(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

```
## ConstrainedBox
> 对其子项施加附加约束的widget
- 构造函数
```javascript
ConstrainedBox({
    Key key,
    @required this.constraints,// 子组件布局的约束条件
    Widget child // 子组件
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
        child: Column(
          children: <Widget>[
            new ConstrainedBox(
              // 约束条件  限制的最小、最大长度和宽度
              constraints: const BoxConstraints(
                minWidth: 50.0,
                minHeight: 50.0,
                maxWidth: 150.0,
                maxHeight: 150.0,
              ),
              // 子组件
              child: new Container(
                width: 20.0,
                height: 20.0,
                color: Colors.green,
              ),
            )
           
        
          ],
        ),
      ),
    );
  }
}


```
## Baseline
> 根据子项的基线对它们的位置进行定位的widget。
- 构造函数
```javascript
Baseline({
    Key key,
    @required this.baseline,// 此组件顶部开始放置子组件的逻辑像素数
    @required this.baselineType,// 基线类型 一个TextBaseline类型的实例 enum 
    Widget child // 子组件
  })
  TextBaseline {
  ///对齐字母字符底部的水平线
  alphabetic,

  ///对齐表意字符的水平线
  ideographic,
}

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("customPainter"),),
      body: Center(
        child: Column(
          children: <Widget>[
          new Baseline(
            baseline: 50.0,//// 此组件顶部开始放置子组件的逻辑像素数
            ///基线类型   对齐字母字符底部的水平线
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'TjTjTj',
              style: new TextStyle(
                fontSize: 16.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          new Baseline(
            baseline: 50.0,
            baselineType: TextBaseline.alphabetic,
            child: new Container(
              width: 30.0,
              height: 30.0,
              color: Colors.red,
            ),
          ),
          new Baseline(
            baseline: 50.0,
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'RyRyRy',
              style: new TextStyle(
                fontSize: 35.0,
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

```
## FractionallySizedBox
> 一个widget，它把它的子项放在可用空间的一小部分。关于布局算法的更多细节，见RenderFractionallySizedOverflowBox。
- 构造函数
```javascript
 FractionallySizedBox({
    Key key,
    this.alignment = Alignment.center, // 对齐方式
    this.widthFactor, // widthFactor >= 0.0用于计算此组件的宽度，子组件的宽度乘以此宽度因子
    this.heightFactor,//  heightFactor >= 0.0 用于计算此组件的高度，子组件的高度乘以此高度因子
    Widget child, // 子组件
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
        child: Column(
          children: <Widget>[
            new Container(
              color: Colors.blue,
              height: 150.0,
              width: 150.0,
              //padding: const EdgeInsets.all(10.0),
              child: new FractionallySizedBox(
                alignment: Alignment.topLeft,// 坐上顶点对齐
                widthFactor: 0.5,// 0.5倍的宽
                heightFactor: 0.5,// 0.5倍的高
                // 子组件
                child: new Container(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

```
## IntrinsicHeight IntrinsicWidget
> IntrinsicHeight:  一个widget，它将它的子widget的高度调整其本身实际的高度。
> IntrinsicWidget: 一个widget，它将它的子widget的宽度调整其本身实际的宽度
- 构造函数
```javascript
IntrinsicHeight({ 
  Key key, 
  Widget child  // 子组件
}) 
IntrinsicWidth({ 
  Key key, 
  this.stepWidth, // 子组件的宽度：n*stepWidth
  this.stepHeight,  // 子组件的高度：n*stepHeight
  Widget child  // 子组件
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
        child: Column(
          children: <Widget>[
            new IntrinsicHeight(
              // 子组件
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // 子组件的高度，自动增加到与下面黄色container同高
                children: <Widget>[
                  new Container(color: Colors.blue, width: 100.0),
                  new Container(color: Colors.red, width: 50.0,height: 50.0,),
                  new Container(color: Colors.yellow, width: 150.0,height: 100,),
                ],
              ),
            ),
            Divider(height: 10,color: Colors.black,),

            new IntrinsicWidth(
              stepHeight: 50.0,
              stepWidth: 40.0, // 子组件的宽度是此值得n倍，此处为4倍，也就是160，因此。蓝色、黄色container的宽度就会自适应到160
              child: new Column(
                children: <Widget>[
                  new Container(color: Colors.blue, height: 100.0),
                  new Container(color: Colors.red, width: 130.0, height: 100.0),
                  new Container(color: Colors.yellow, height: 150.0,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

```
## LimitedBox
> 一个当其自身不受约束时才限制其大小的盒子。
- 构造函数
```javascript
LimitedBox({
    Key key,
    this.maxWidth = double.infinity,// 没有BoxConstraints.maxWidth约束的情况下的最大宽度约束
    this.maxHeight = double.infinity,// 没有BoxConstraints.maxHeight约束的情况下的最大高度约束
    Widget child,// 子组件
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
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 100,
              width: 250.0,
            ),
            LimitedBox(
              maxWidth: 100.0, // 没有作用？？
              maxHeight: 50, // 最大高度
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 250.0,
              ),
            )
           

            
           
        
          ],
        ),
      ),
    );
  }
}

```
## offstage
> 一个布局widget，可以控制其子widget的显示和隐藏。
- 构造函数
```javascript
Offstage({ 
  Key key, 
  this.offstage = true, // 控制子组件的显示与隐藏，true为隐藏，false为显示
  Widget child // 子组件
})

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
  bool offstage;

  @override
  void initState() {
    super.initState();
    offstage = false;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("customPainter"),),
      body: Center(
        child: Column(
          children: <Widget>[
            new Offstage(
              offstage: offstage, // // 控制子组件的显示与隐藏，true为隐藏，false为显示
              child: Container(color: Colors.blue, height: 100.0),
            ),
            new CupertinoButton(
              child: Text("点击切换显示"),
              onPressed: () {
                setState(() {
                  offstage = !offstage;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

```
## SizedBox  OverflowBox SizedOverflowBox
> SizedBox:一个特定大小的盒子。这个widget强制它的孩子有一个特定的宽度和高度。如果宽度或高度为NULL，则此widget将调整自身大小以匹配该维度中的孩子的大小。
> OverflowBox: 对其子项施加不同约束的widget，它可能允许子项溢出父级
> SizedOverflowBox: 一个特定大小的widget，但是会将它的原始约束传递给它的孩子，它可能会溢出
- 构造函数
```javascript
SizedBox({ 
  Key key, 
  this.width, // 强制设置子组件的宽度，设置此值后，子组件的宽度将无效
  this.height, // 强制设置子组件的高度，设置此值后，子组件的宽度将无效
  Widget child // 子组件
})
OverflowBox({
    Key key,
    this.alignment = Alignment.center,// 对齐方式
    this.minWidth,// 最小宽度
    this.maxWidth,// 最大宽度
    this.minHeight,// 最小高度
    this.maxHeight,// 最大高度
    Widget child,
})
SizedOverflowBox({
    Key key,
    @required this.size, // 组件大小设置
    this.alignment = Alignment.center,// 对齐方式
    Widget child, // 子组件
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
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: 100.0,// 设置此值后，子组件设置的宽度无效
                height: 100.0,// 设置此值后，子组件设置的高度无效
                child: Container(
                  color: Colors.red,
                  width: 50.0,
                  height: 150.0,
                ),
              )
            ),
            Divider(height: 15,color: Colors.black,),
            Container(
              color: Colors.green,
              width: 100.0,
              height: 100.0,
              padding: const EdgeInsets.all(5.0),
              // overflowBox包裹的子组件可以溢出容器container
              child: OverflowBox(
                alignment: Alignment.topLeft,// 坐上角对齐
                maxWidth: 150.0, // 最大宽度
                maxHeight: 150.0,// 最大高度
                minWidth: 125.0, // 最小宽度
                minHeight: 125.0,// 最小高度
                // 设置最大最小高度和宽度之后，子组件设置的宽度，高度无效了，小于最小按最小，大于最大按最大
                child: Container(
                  color: Colors.grey,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Divider(height: 50,color: Colors.black,),
            Container(
              color: Colors.green,
              alignment: Alignment.topRight,
              width: 100.0,
              height: 100.0,
              padding: EdgeInsets.all(5.0),
              // 没弄明白？？
              child: SizedOverflowBox(
                size: Size(50.0, 100.0),// 设置width 50 高100
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.red, 
                  width: 100.0, 
                  height: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```
## CustomSingleChildLayout
> 一个自定义的拥有单个子widget的布局widget。
- 构造函数
```javascript
CustomSingleChildLayout({
    Key key,
    @required this.delegate,// 控制自己布局的委托
    Widget child // 子组件
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
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(5.0),
              child: CustomSingleChildLayout(
                // 子组件布局委托类
                delegate: FixedSizeLayoutDelegate(Size(200.0, 200.0)),
                // 子组件
                child: Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 300.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 控制子组件布局的委托类
class FixedSizeLayoutDelegate extends SingleChildLayoutDelegate {
  FixedSizeLayoutDelegate(this.size);

  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(FixedSizeLayoutDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}

```
