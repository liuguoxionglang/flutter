# flutter widget组件之-----------布局组件(多个子元素)
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## Row
> Row: 在水平方向上排列子widget的列表 继承自Flex
- 构造函数
```javascript
Row({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,// 主轴对齐方式 主轴为水平防线
    MainAxisSize mainAxisSize = MainAxisSize.max,// 子组件在主轴上应占用的空间，默认最大
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, // 次轴对齐方式 此处为垂直方向
    TextDirection textDirection,// 子项的水平排列顺序
    VerticalDirection verticalDirection = VerticalDirection.down,//// 垂直方向上的起始位置，down:从上往下，up:从下往上 
    TextBaseline textBaseline,// 文本基线
    List<Widget> children = const <Widget>[],// 子组件集合
}) 

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴对齐方式，子项均分布局空间
          mainAxisSize: MainAxisSize.min,/// 子组件在主轴上应占用的控件
          crossAxisAlignment: CrossAxisAlignment.center,// 次轴对齐方式 此处为垂直方向
          textDirection: TextDirection.rtl,// 子项的水平排列顺序 
          verticalDirection: VerticalDirection.down, // // 垂直方向上的起始位置，down:从上往下，up:从下往上
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Expanded(
              child: Image.asset("assets/images/2.jpg"),
            ),
            Expanded(
              child: Text('row', textAlign: TextAlign.center),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



```
## Column
> Column: 在垂直方向上排列子widget的列表
- 构造函数
```javascript
Column({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, // 主轴对齐方式   此处为垂直方向
    MainAxisSize mainAxisSize = MainAxisSize.max,// 子组件在主轴上应占用的控件，默认最大
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,// 次轴对齐方式 此处为水平方向
    TextDirection textDirection,// 文本方向
    VerticalDirection verticalDirection = VerticalDirection.down,,// 垂直方向上的起始位置，down:从上往下，up:从下往上
    TextBaseline textBaseline,// 文本基线
    List<Widget> children = const <Widget>[],
})


``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 主轴对齐方式   此处为垂直方向上的居中方式
          mainAxisSize: MainAxisSize.max,// 子组件在主轴上应占用的空间
          crossAxisAlignment: CrossAxisAlignment.stretch,// 次轴对齐方式 此处为水平方向上的对齐方式
          //textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.up, // 垂直方向上的起始位置，down:从上往下，up:从下往上
          children: <Widget>[
            Image.asset('assets/images/4.jpg',width: 50,height: 60,),
            Text('COLUMN'),
            Image.asset('assets/images/1.png',width: 50,height: 60,),
          ],
        ),
    );
  }
}

```
## Stack
> 可以允许其子widget简单的堆叠在一起,上下层覆盖，栈中前面的在底层显示，后面的在顶层显示
- 构造函数
```javascript
Stack({
    Key key,
    this.alignment = AlignmentDirectional.topStart,// 对齐方式
    this.textDirection, // 文本方向
    this.fit = StackFit.loose,//确定堆栈中未定位子项的大小。
    this.overflow = Overflow.clip,// 溢出容器的子项的处理
    List<Widget> children = const <Widget>[],// 子项
  })
``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Stack(
          alignment:Alignment(0.6,0.6),// 子组件的对齐位置
          textDirection: TextDirection.rtl,//文本方向 ？？
          fit: StackFit.loose,//栈中未定位子项的大小
          overflow: Overflow.clip, //溢出容器的子项的处理方式  裁剪、可视等
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pic.jpg'),
              radius: 100.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                'Mia B',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
    );
  }
}

```
## IndexedStack
> 从一个子widget列表中显示单个孩子的Stack，继承了Stack
- 构造函数
```javascript
IndexedStack({
    Key key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,// 对齐方式
    TextDirection textDirection, // 文本方向
    StackFit sizing = StackFit.loose,//确定堆栈中未定位子项的大小。
    this.index = 0,//栈中子组件的序号
    List<Widget> children = const <Widget>[],//子项
  }) 


``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Container(
        color: Colors.yellow,
        child: IndexedStack(
          index: 0, // 栈中子组件的序号
          alignment: const Alignment(0.6, 0.6),
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pic.jpg'),
              radius: 100.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                'Mia B',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
## Flow
> 一个实现流式布局算法的widget
- 构造函数
```javascript
Flow({
    Key key,
    @required this.delegate,// 创建流失布局的算法
    List<Widget> children = const <Widget>[],// 子组件
  }) 

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
   var width = 80.0;
  var height = 60.0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Container(
        color: Colors.black,
        child:Flow(
          // 流失布局算法
          delegate: TestFlowDelegate(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
          // 子组件
          children: <Widget>[
            new Container(width: width, height: height, color: Colors.yellow,),
            new Container(width: width, height: height, color: Colors.green,),
            new Container(width: width, height: height, color: Colors.red,),
            new Container(width: width, height: height, color: Colors.pink,),
            new Container(width: width, height: height, color: Colors.blue,),
            new Container(width: width, height: height, color: Colors.lightGreenAccent,),
          ],
        ),
      ),
    );
  }
}
// 流失布局的算法
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      // 第i个组件的右边起点x坐标 小于屏幕的宽度，则在同一行中绘制，否则换行绘制
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}


```
## Table
> 为其子widget使用表格布局算法的widget
- 构造函数
```javascript
Table({
    Key key,
    this.children = const <TableRow>[],//表格行
    this.columnWidths,// 表格列宽
    this.defaultColumnWidth = const FlexColumnWidth(1.0),// 没有设置宽度的列默认的列宽
    this.textDirection,// 列的排列方向，从左到右，或从右到左
    this.border,// 表格网格线样式
    this.defaultVerticalAlignment = TableCellVerticalAlignment.top,// 单元格内垂直方向上文本的对齐方式
    this.textBaseline,// 基线
})
TableRow({ 
  this.key, 
  this.decoration,//装饰器
  this.children // 子项 单元格
})


``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
   var width = 80.0;
  var height = 60.0;
 
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

```
## Wrap
> 可以在水平或垂直方向多行显示其子widget
- 构造函数
```javascript
Wrap({
    Key key,
    this.direction = Axis.horizontal,// 主轴方向，默认水平
    this.alignment = WrapAlignment.start,// 子项在主轴上的排列方式
    this.spacing = 0.0,// 主轴方向上子项之间的距离
    this.runAlignment = WrapAlignment.start,// 子项在次轴上的排列方式
    this.runSpacing = 0.0,// 次轴方向上子项之间的距离
    this.crossAxisAlignment = WrapCrossAlignment.start,//子项在次轴上的排列方式 
    this.textDirection,// 子项在水平方向上的排列方式 
    this.verticalDirection = VerticalDirection.down,// 子项在垂直方向上的排列方式
    List<Widget> children = const <Widget>[],// 子项
  })

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row  column"),),
      body: Container(
        child: Wrap(
          direction: Axis.horizontal,// 主轴方向为水平方向
          spacing: 30.0, // 主轴方向上子项之间的距离
          runSpacing: 2.0, // 次轴方向上子项之间的距离
          alignment: WrapAlignment.end,//按主轴末端对齐
          runAlignment: WrapAlignment.center,// 次轴居中显示
          crossAxisAlignment: WrapCrossAlignment.start,//按次轴起始端对齐
          textDirection: TextDirection.rtl,// 子项在水平方向上从右到左
          verticalDirection: VerticalDirection.up,// 子项在垂直方向上从下到上排列
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: new Text('AH', style: TextStyle(fontSize: 10.0),)),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: new Text('ML', style: TextStyle(fontSize: 10.0),)),
              label: Text('Lafayette'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: new Text('HM', style: TextStyle(fontSize: 10.0),)),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: new Text('JL', style: TextStyle(fontSize: 10.0),)),
              label: Text('Laurens'),
            ),
          ],

        ),
      
      ),
    );
  }
}

```
## ListBody
> 一个widget，它沿着一个给定的轴，顺序排列它的子元素
- 构造函数
```javascript
 ListBody({
    Key key,
    this.mainAxis = Axis.vertical,// 主轴方向
    this.reverse = false,//子项是否按照阅读方向排列 即在主轴方向按子项集合顺序依次排列，若为false,则按照次序，否则，按照倒序排列
    List<Widget> children = const <Widget>[],// 子项
  })


``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list body"),),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          // 外面不嵌套一层flex,直接放置listbody绘制不出来 ？？？
          ListBody(
            mainAxis: Axis.vertical,//主轴方向 默认垂直方向为主轴方向
            reverse: true,// 此处 按照子项集合的倒序在垂直方向排列
            children: <Widget>[
              Container(color: Colors.red, width: 50.0, height: 50.0,),
              Container(color: Colors.yellow, width: 50.0, height: 50.0,),
              Container(color: Colors.green, width: 50.0, height: 50.0,),
              Container(color: Colors.blue, width: 50.0, height: 50.0,),
              Container(color: Colors.black, width: 50.0, height: 50.0,), 
            ],
        )
        ],
      ),
    );
  }
}

```
## ListView
> 一个拥有绘制、定位、调整大小的 widget
- 构造函数
```javascript
ListView({
    Key key,
    Axis scrollDirection = Axis.vertical,//滚动方向 默认垂直方向
    bool reverse = false,////是否倒序显示 默认正序 false  倒序true
    ScrollController controller,//  //滑动监听
    bool primary,//如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
    ScrollPhysics physics, //滑动类型设置
    bool shrinkWrap = false, //内容适配
    EdgeInsetsGeometry padding,
    this.itemExtent,  //确定每一个item的高度 会让item加载更加高效
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,//cacheExtent  设置预加载的区域 
    List<Widget> children = const <Widget>[],
    int semanticChildCount,
  })
ListView.builder({
    // 省略其它
    @required IndexedWidgetBuilder itemBuilder,
})
ListView.separated({
   // 省略其它
    @required IndexedWidgetBuilder itemBuilder,
    @required IndexedWidgetBuilder separatorBuilder,
 
})
ListView.custom({
    // 省略其它
    @required this.childrenDelegate,
 
})


``` 
- 应用示例
```javascript
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
// 定义列表数据类型
class BaseBean {
  String name;
  int age;
  String content;
  BaseBean(this.name, this.age, this.content);
}
// 利用list.generate函数  构造列表数据集合
List<BaseBean> list = new List<BaseBean>.generate(
    60, (i) => new BaseBean("name$i", i, "content=$i"));

class MyStatePageState extends State<MyStatePage> {
  
  // listview 构造函数构建 
  Widget listViewLayout(){
    return ListView(
      scrollDirection: Axis.vertical,
      reverse: true,// true 子项集合倒序排列
      primary: false,// 似乎没毛用
      padding: EdgeInsets.all(20.0),
      // physics: NeverScrollableScrollPhysics(),// 滚动类型， 此处设置为不滚动
      children: <Widget>[
        Text('I\'m dedicating every day to you'),
        ListTile(title: Text("1"),),
        Text('Domestic life was never quite my style'),
        ListTile(title: Text("2"),),
        Text('When you smile, you knock me out, I fall apart'),
        ListTile(title: Text("3"),),
        Text('And I thought I was so smart'),
        ListTile(title: Text("4"),),
        ListTile(title: Text("5"),),
        ListTile(title: Text("6"),),
        ListTile(title: Text("7"),),
        ListTile(title: Text("8"),),
        ListTile(title: Text("9"),),
        ListTile(title: Text("11"),),
        ListTile(title: Text("12"),),
        ListTile(title: Text("13"),),

      ],
    );
  }

  // listView builder 构建视图列表
  Widget listViewLayoutBuilder(List<BaseBean> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,   // 主轴防线
        padding: EdgeInsets.all(10.0),
        reverse: false,
        primary: true,
        itemExtent: 50.0,// 每一个子项的高度
        shrinkWrap: true,// 内容适配
        itemCount: list.length,  // 子项数量   
        cacheExtent: 30.0, //预加载30条
        physics: new ClampingScrollPhysics(),// 此处设置股东类型为 包裹内容 不会有回弹
        //  controller ,// 滚动位置控制器
        // 创建子项widgets
        itemBuilder: (context, i) => new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(
                    "${list[i].name}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                  new Text(
                    "${list[i].age}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.green),
                  ),
                  new Text(
                    "${list[i].content}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                  ),
                ],
              ),
            ));
  }


  ///  listView separated 构建视图列表 用于多类型 分割
  Widget listViewLayoutSeparated(List<BaseBean> list) {
    return ListView.separated(
      itemCount: list.length,//子项数量
      // 创建分割子项的widgets
      separatorBuilder: (content, index) {
        //和itemBuilder 同级别的执行
        if (index == 2) {
          return new Container(
            height: 40.0,
            child: new Center(
              child: new Text("类型1"),
            ),
            color: Colors.red,
          );
        } else if (index == 7) {
          return new Container(
            height: 40.0,
            child: new Center(
              child: new Text("类型2"),
            ),
            color: Colors.blue,
          );
        } else if (index == 14) {
          return new Container(
            height: 40.0,
            child: new Center(
              child: new Text("类型3"),
            ),
            color: Colors.yellow,
          );
        } else {
          return new Container();
        }
      },
      // 创建子项widgets
      itemBuilder: (content, i) {
        return new InkWell(
          child: new Container(
              height: 30.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(
                    "${list[i].name}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                  new Text(
                    "${list[i].age}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.green),
                  ),
                  new Text(
                    "${list[i].content}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                  ),
                ],
              )),
          onTap: () {
            print("1111");
          },
        );
  //      return ;
      },
    );
  }

  ///listView custom 构建视图列表
  Widget listViewLayoutCustom(List<BaseBean> list) {
      return ListView.custom(
        itemExtent: 40.0,// 每个子项的高度
        // 构建子项的代理
        childrenDelegate: MyChildrenDelegate(
          (BuildContext context, int i) {
            return new Container(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  "${list[i].name}",
                  style: new TextStyle(fontSize: 18.0, color: Colors.red),
                ),
                new Text(
                  "${list[i].age}",
                  style: new TextStyle(fontSize: 18.0, color: Colors.green),
                ),
                new Text(
                  "${list[i].content}",
                  style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ],
            ));
          },
          childCount: list.length,
        ),
        cacheExtent: 0.0,
      );
    
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list body"),),
      // body:listViewLayout(),
      // body:listViewLayoutBuilder(list),
      // body:listViewLayoutSeparated(list),
      body:listViewLayoutCustom(list),
    );
  }
}

// 自定义listview布局的代理类
class MyChildrenDelegate extends SliverChildBuilderDelegate {
  MyChildrenDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive = true,
    bool addRepaintBoundaries = true,
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
  }

  // 可不重写 重写不能为null  默认是true  添加进来的实例与之前的实例是否相同 相同返回true 反之false
  // listView 暂时没有看到应用场景 源码中使用在 SliverFillViewport 中
  @override
  bool shouldRebuild(SliverChildBuilderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    // return super.shouldRebuild(oldDelegate);
    return this !=oldDelegate;
  }
}







```
## CustomMultiChildLayout
> 使用一个委托来对多个孩子进行设置大小和定位的小部件
- 构造函数
```javascript
CustomMultiChildLayout({
    Key key,
    @required this.delegate,// 委托方法
    List<Widget> children = const <Widget>[],// 子项
  })


``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list body"),),
      body: Container(
        width: 200.0,
        height: 100.0,
        color: Colors.yellow,
        child: CustomMultiChildLayout(
          delegate: TestLayoutDelegate(),//各子项尺寸、位置布局
          children: <Widget>[
            // 每一个子节点必须用一个LayoutId控件包裹起来
            LayoutId(
              id: TestLayoutDelegate.title,
              child: new Text("标题",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
            ),
            LayoutId(
              id: TestLayoutDelegate.description,
              child: new Text("子标题",
                  style: TextStyle(fontSize: 14.0, color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}

// 子项布局的控制方法
class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints =
        new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}

```
## LayoutBuilder
> LayoutBuilder构建一个可以依赖父窗口大小的widget树。
- 构造函数
```javascript
LayoutBuilder({
    Key key,
    @required this.builder // 构建者
  }) 
``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list body"),),
      body: Container(
        width: 200.0,
        height: 100.0,
        color: Colors.yellow,
        child: LayoutBuilder(
          builder:(BuildContext context, BoxConstraints constraints){
            //其它操作， 返回一个widget
            return Container(child: Text("layout builder"),);
          } ,

        ),
      ),
    );
  }
}

```
