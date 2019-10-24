# flutter material widget组件之-----------按钮(button)
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## RaisedButton
> Material Design中的button， 一个凸起的材质矩形按钮
- 构造函数
```javascript
    RaisedButton({
        Key key, 
        @required VoidCallback onPressed, // 单击回调函数
        ValueChanged<bool> onHighlightChanged, 
        ButtonTextTheme textTheme, //文本主体
        Color textColor, //文本颜色
        Color disabledTextColor, // 按钮无法点击时的文本颜色
        Color color, // button颜色
        Color disabledColor, // 按钮无法点击时的按钮颜色
        Color highlightColor, // 点击后高亮颜色
        Color splashColor, // 点击时波动颜色
        Brightness colorBrightness, // 颜色亮度
        double elevation, //z轴坐标 好像没卵用
        double highlightElevation, // 高亮时，z轴坐标  好像没卵用
        double disabledElevation, // 无法点击时z轴坐标
        EdgeInsetsGeometry padding, // 内边距
        ShapeBorder shape, // button形状 ShapeBorder的实现有CircleBorder类等
        Clip clipBehavior, //剪切行为，没看出啥变化
        MaterialTapTargetSize materialTapTargetSize, //材料适配目标大小
        Duration animationDuration, 
        Widget child  //子组件
    })

```
- 应用示例
```javascript
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
                appBar: AppBar(title: Text(widget.title),),
                body:Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                            const RaisedButton(
                                onPressed: null,
                                //子组件内容
                                child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
                            ),
                            const SizedBox(height: 30),
                            RaisedButton(
                                onPressed: () {},
                                child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
                                disabledColor: Colors.red, // 按钮无法点击时的按钮颜色
                                disabledTextColor: Colors.black,// 按钮无法点击时的文本颜色
                                color: Colors.lightBlue, // button颜色
                                //highlightColor: Colors.orange,// 点击后高亮颜色
                                splashColor: Colors.green, // 点击时波动颜色
                                colorBrightness: Brightness.light, // 颜色亮度
                                elevation: 12,//z轴坐标 好像没卵用
                                highlightElevation: 20,// 高亮时，z轴坐标  好像没卵用
                                disabledElevation: 30, // 无法点击时z轴坐标
                                // shape: CircleBorder(side:BorderSide(color: Colors.red) ),// button形状 ，此处设置圆形
                                // clipBehavior: Clip.hardEdge,//剪切行为，没看出啥变化
                                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,//材料适配目标大小
                                animationDuration: Duration(microseconds: 5000), // 动效时间  没看出啥效果着

                            ),
                            const SizedBox(height: 30),
                            RaisedButton(
                                onPressed: () {},
                                textColor: Colors.white,//文本颜色
                                padding: const EdgeInsets.all(0.0), // 内边距
                                child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: <Color>[
                                            Color(0xFF0D47A1),
                                            Color(0xFF1976D2),
                                            Color(0xFF42A5F5),
                                            ],
                                        ),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text('Gradient Button', style: TextStyle(fontSize: 20)),
                                ),
                            ),
                        ],
                    ),
                )
            );
        }
    }

    
``` 
## FloatingActionButton
> 一个圆形图标按钮，它悬停在内容之上，以展示应用程序中的主要动作。FloatingActionButton通常用于Scaffold.floatingActionButton字段 
- 构造函数
```javascript
    FloatingActionButton({
        Key key,
        this.child,// 子组件
        this.tooltip,// 长按鼠标时提示内容
        this.foregroundColor,// 文本或者图标颜色，即child组件的颜色
        this.backgroundColor,//背景色
        this.heroTag = const _DefaultHeroTag(),// 是一个object类对象，没弄出啥效果
        this.elevation = 6.0,// z轴坐标
        this.highlightElevation = 12.0,//高亮是z轴坐标
        @required this.onPressed,//点击时的回调函数 必传参数
        this.mini = false,// 是否迷你型，默认false
        this.shape = const CircleBorder(),//形状
        this.clipBehavior = Clip.none,//剪切行为，没看出啥变化
        this.materialTapTargetSize,//材料适配目标大小
        this.isExtended = false,// 是否继承父组件的相应属性， 个人理解，没看到啥效果
    })

```
- 应用示例
```javascript
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
                appBar: AppBar(title: Text(widget.title),),
                floatingActionButton: FloatingActionButton(
                    tooltip: "提示",// 长按鼠标时提示内容
                    onPressed: () {},//点击时的回调函数
                    child: Icon(Icons.thumb_up),//子组件
                    backgroundColor: Colors.pink,//背景色
                    foregroundColor: Colors.black,// 文本或者图标颜色，即child组件的颜色
                    // heroTag: Object(),
                    mini:true ,// 是否迷你型，默认false
                    // shape: CircleBorder(side: BorderSide(color: Colors.black)),//形状
                    clipBehavior: Clip.antiAlias, //剪切行为，没看出啥变化
                    materialTapTargetSize: MaterialTapTargetSize.padded, //材料适配目标大小
                    isExtended:false ,// 是否继承父组件的相应属性， 个人理解，没看到啥效果

                ),
                body:Center(
                    child: Text("FLOATINGACTIONBUTTON")
                )
            );
        }
    }

    
``` 
## FlatButton
> 一个扁平的Material按钮
- 构造函数
```javascript
    FlatButton({
        Key key,
        @required VoidCallback onPressed, //回调函数
        ValueChanged<bool> onHighlightChanged,//
        ButtonTextTheme textTheme,//文本主体
        Color textColor,//文本颜色
        Color disabledTextColor,//禁用时的文本颜色
        Color color,//按钮颜色
        Color disabledColor,//禁用时的颜色
        Color highlightColor,//高亮时的颜色
        Color splashColor,//点击波动效果的颜色
        Brightness colorBrightness,//颜色亮度
        EdgeInsetsGeometry padding,//内边距
        ShapeBorder shape,//形状
        Clip clipBehavior = Clip.none,//剪切行为，没弄出效果
        MaterialTapTargetSize materialTapTargetSize,//材料匹配目标大小
        @required Widget child,//子组件
    })

```
- 应用示例
```javascript
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
                appBar: AppBar(title: Text(widget.title),),
                body:Center(
                    child:Column(
                    children:  <Widget>[
                    FlatButton(
                        color: Colors.blue,// 按钮颜色
                        splashColor: Colors.blueAccent,//点击波动效果的颜色
                        onPressed: () {},//回调函数
                        //子组件
                        child: Text(
                        "Flat Button",
                        style: TextStyle(fontSize: 20.0),
                        ),
                    )
                    ],
                    )
                )
            );
        }
    }

    
``` 
## PopupMenuButton
> 当菜单隐藏式，点击或调用onSelected时显示一个弹出式菜单列表，PopupMenuEntry是个抽象类，PopupMenuItem类继承了PopupMenuEntry
- 构造函数
```javascript
    PopupMenuButton({
        Key key,
        @required this.itemBuilder,//创建每个条目
        this.initialValue,//初始子项值，就是说初始高亮选中的子项值
        this.onSelected,// 选中时的回调
        this.onCanceled,//点击返回键，或者是点击外部， popupmenu关闭时的回调
        this.tooltip,// 长按提示
        this.elevation = 8.0,// z坐标轴坐标
        this.padding = const EdgeInsets.all(8.0),//内边距
        this.child,//按钮的子组件 icon 和 child 不能同时设置， 否则报错
        this.icon,// 按钮的icon图标，默认三个竖排小圆点 icon 和 child 不能同时设置， 否则报错
        this.offset = Offset.zero, //根据当前控件，向右向下平移。默认是跟当前控件的左上角对齐
    })
    PopupMenuItem({
        Key key,
        this.value,// 子项的值
        this.enabled = true,// 是否可用
        this.height = _kMenuItemHeight, // 每个子项高度
        @required this.child,//子项内容
    }) 

```
- 应用示例
```javascript
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
  var _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          // 弹出菜单按钮
          PopupMenuButton(
            initialValue: _selectedValue,// 初始选中的子项的value值
            offset:Offset(200,100) ,// x y轴便宜，x轴200，y轴100,x轴似乎没有起作用？
            tooltip: "长按提示",// 长按提示
            icon: Icon(Icons.more_vert),//按钮图标，默认三个竖排小圆点
            // 关闭时的回调函数
            onCanceled: (){},
            // 选中时的回调函数
            onSelected: (result){
              setState(() {
                _selectedValue = result;
              });
            },
            // 创建每个子项
            itemBuilder: (BuildContext context)=><PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text("音乐"),
              ),
              const PopupMenuItem(
                value: 2,//子项的值
                enabled: false,// 是否可用,默认true
                height: 100,// 每个子项高度
                child: Text("音乐"),// 子项内容
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("音乐"),
              ),
            ],
            // child: Text("data"),// 与icon不能共存
          )
        ],
      ),
      body:Center(
        child:Text("popupMenuButton")
      )
    
    );
  }
}

    
``` 
## ButtonBar
> 水平排列的按钮组
- 构造函数
```javascript
    ButtonBar({
        Key key,
        this.alignment = MainAxisAlignment.end,// 主轴对齐方式
        this.mainAxisSize = MainAxisSize.max,// 主轴大小
        this.children = const <Widget>[],//子组件
    })

```
- 应用示例
```javascript
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
        child:ButtonBar(
            alignment: MainAxisAlignment.center, // 主轴方向居中显示
            mainAxisSize: MainAxisSize.max,// 主轴按容器最大显示
             // 子组件数组
            children: <Widget>[
                IconButton(
                    icon: Icon(Icons.access_alarm),
                    onPressed: (){},
                ),
                RaisedButton(
                    onPressed: (){},
                )
            ],
        )
      )
    
    );
  }
}

    
``` 
## IconButton
> 一个Material图标按钮，点击时会有水波动画
- 构造函数
```javascript
    IconButton({
        Key key,
        this.iconSize = 24.0,// 图标大小
        this.padding = const EdgeInsets.all(8.0),//内边距
        this.alignment = Alignment.center,//居中方式
        @required this.icon,// 按钮图标  必须
        this.color,//颜色
        this.highlightColor,//高亮颜色
        this.splashColor,// 点击波动颜色
        this.disabledColor,//警用颜色
        @required this.onPressed,// 点击回调函数
        this.tooltip// 长按提示
    })

```
- 应用示例
```javascript
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
        actions: <Widget>[
          new IconButton( // action button
            icon: new Icon(Icons.add_a_photo),//图标
            // 点击回调函数
            onPressed: () { 
              setState(() {
                              
              });

            },
            iconSize: 20,// 图标大小
            alignment:Alignment.bottomRight,//居中方式
            color: Colors.black,//颜色
            highlightColor: Colors.orange,//高亮颜色
            
          ),
          new IconButton( // action button
            icon: new Icon(Icons.add_alarm),
            onPressed: () { },
          ),
        ],
      
      ),
      body:Center(
        child:Text("IconButton")
      )
    
    );
  }
}

    
``` 