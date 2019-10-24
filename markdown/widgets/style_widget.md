# flutter widget组件之-----------样式组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## padding
> 一个widget, 会给其子widget添加指定的填充，padding会根据外层容器大小及 Padding的内边距，自适应其子部件，
- 构造函数
```javascript
 Padding({
    Key key,
    @required this.padding,//内边距
    Widget child,// 子部件
  })
``` 
- 应用示例
```javascript
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => new _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('样式。。。widget')
        ),
        body: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(border:Border.all(color: Colors.red) ),
          // padding会根据外层容器大小及 Padding的内边距，自适应其子部件
          child: Padding(
            padding: EdgeInsets.all(10.0),//内边距
            // 子部件
            child: Container(
              decoration: BoxDecoration(border:Border.all(color: Colors.red) ),
              child: Text('Hello World!')
            ),
          ),

        ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: 'Flutter Demo',
      home: new MyApp()
  ));
}

```
## Theme
> 将主题应用于子widget。主题描述了应用选择的颜色和字体,
- 构造函数
```javascript
Theme({
    Key key,
    @required this.data,// ThemeData数据
    this.isMaterialAppTheme = false,//若为true,则组件出题有materialApp控制
    @required this.child,//子部件跟随theme设置的样式
})
factory ThemeData({
    Brightness brightness,//亮度
    MaterialColor primarySwatch,//用于导航栏、FloatingActionButton的背景色等
    Color primaryColor,// 原色
    Brightness primaryColorBrightness,//颜色亮度
    Color primaryColorLight,
    Color primaryColorDark,
    Color accentColor,
    Brightness accentColorBrightness,
    Color canvasColor,//canvas画布颜色
    Color scaffoldBackgroundColor,//脚手架背景色主题
    Color bottomAppBarColor,//底部导航颜色主题
    Color cardColor,//card组件主题颜色
    Color dividerColor,//divider组件主题颜色
    Color highlightColor,
    Color splashColor,//波动主题颜色
    InteractiveInkFeatureFactory splashFactory,
    Color selectedRowColor,
    Color unselectedWidgetColor,
    Color disabledColor,
    Color buttonColor,
    ButtonThemeData buttonTheme,
    Color secondaryHeaderColor,
    Color textSelectionColor,
    Color cursorColor,
    Color textSelectionHandleColor,
    Color backgroundColor,
    Color dialogBackgroundColor,
    Color indicatorColor,
    Color hintColor,
    Color errorColor,
    Color toggleableActiveColor,
    String fontFamily,
    TextTheme textTheme,
    TextTheme primaryTextTheme,
    TextTheme accentTextTheme,
    InputDecorationTheme inputDecorationTheme,
    IconThemeData iconTheme,//用于Icon颜色
    IconThemeData primaryIconTheme,
    IconThemeData accentIconTheme,
    SliderThemeData sliderTheme,
    TabBarTheme tabBarTheme,
    ChipThemeData chipTheme,
    TargetPlatform platform,
    MaterialTapTargetSize materialTapTargetSize,
    PageTransitionsTheme pageTransitionsTheme,
    ColorScheme colorScheme,
    DialogTheme dialogTheme,
    Typography typography,
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
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.pink
      ),
      home: ThemeTestRoute(),
    );
  }
}
class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.red; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ]
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: Colors.black
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
            onPressed: () =>  //切换主题
                setState(() =>
                _themeColor =
                _themeColor == Colors.teal ? Colors.blue : Colors.teal
                ),
            child: Icon(Icons.palette)
        ),
      ),
      isMaterialAppTheme: true,
    );
  }
}

```
## MediaQuery
>  MediaQuery建立一个子树，在树中媒体查询解析不同的给定数据;
> 例如，要了解当前媒体的大小（例如，包含您的应用程序的窗口），您可以从MediaQuery.of：MediaQuery.of(context).size返回的ediaQueryData中读取MediaQueryData.size属性。
> 使用MediaQuery.of查询当前媒体将导致您的窗口小部件在MediaQueryData更改时自动重建（例如，如果用户旋转其设备）。如果MediaQuery没有在范围内，则MediaQuery.of方法将抛出异常，除非将nullOk参数设置为true，在这种情况下它返回null。

- 构造函数
```javascript
MediaQuery({
    Key key,
    @required this.data,//
    @required Widget child,// 子组件不能为空
})
// MediaQueryData: 关于一个媒体（例如，window）的信息。例如，MediaQueryData.size属性包含当前窗口的宽度和高度。
MediaQueryData({
    this.size = Size.zero,
    this.devicePixelRatio = 1.0,
    this.textScaleFactor = 1.0,
    this.padding = EdgeInsets.zero,
    this.viewInsets = EdgeInsets.zero,
    this.alwaysUse24HourFormat = false,
    this.accessibleNavigation = false,
    this.invertColors = false,
    this.disableAnimations = false,
    this.boldText = false,
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
      home: ThemeTestRoute(),
    );
    // return WidgetsApp(
    //   color: Colors.red,
    //   home:   MediaQuery(
    //         data: MediaQueryData(
    //           size: Size(20, 50),
    //           textScaleFactor: 2
    //         ),
    //         child: Container(child: Text(".....data"),),
    //     ) ,
    //     builder: (BuildContext context, Widget child){
    //       return Text("fffffffffff");
    //     },
    // );
  }
}
class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("mediaquery")),
        body: MediaQuery(
          data: MediaQueryData(
            size: Size(20, 50),
            devicePixelRatio: 5,//分辨率
            textScaleFactor: 2
          ),
          child: Container(child: Text("我是mediaquery"),),
        ),

    );
  }
}


```
