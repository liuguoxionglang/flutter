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
  /*
    GlobalKey：整个应用程序中唯一的键
    ScaffoldState：Scaffold框架的状态
    解释：_scaffoldKey的值是Scaffold框架状态的唯一键
   */
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // VoidCallback：没有参数并且不返回数据的回调
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
  }

  // showBottomSheet   不合适呀。。。。
  void _showBottomSheet() {
    setState(() {
      // 禁用按钮
      _showBottomSheetCallback = null;
    });
    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context){
      final ThemeData themeData = Theme.of(context);
      return new Container(
          decoration: new BoxDecoration(
              border: new Border(top: new BorderSide(color: themeData.disabledColor))
          ),
          child: new Padding(
              padding: const EdgeInsets.all(32.0),
              child: new Text(
                  '这是一个持久性的底部面板，向下拖动即可将其关闭',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: themeData.accentColor,
                      fontSize: 24.0
                  )
              )
          )
      );
    })
    /*
      closed：当此对象控制的元素不再可见时完成
      whenComplete：注册将在此未来完成时调用的函数
      解释：联系上文，closed控制的元素是新构建的质感设计底部面板，因此代码大意为，
           注册底部面板不再可见时调用的函数
     */
        .closed.whenComplete((){
      // mounted：bool值，这个State对象当前是否在树中
      if (mounted) {
        setState(() {
          // 重新启用按钮
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: RaisedButton(
          child: Text("底部面板"),
          // onPressed:_showBottomSheetCallback // 不合适  啥东东？？
          onPressed: (){
            // showModalBottomSheet<T>：显示模态质感设计底部面板
            showModalBottomSheet<Null>(
              context:context, // 执行上下文
              // widget的创建函数
              builder:(BuildContext context) {
                return new Container(
                    child: new Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: new Text(
                            '这是模态底部面板，点击任意位置即可关闭',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 24.0
                            )
                        )
                    )
                );
              }
            );
          },

        ),
      )
    
    );
  }
}
