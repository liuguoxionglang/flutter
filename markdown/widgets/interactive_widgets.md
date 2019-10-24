# flutter widget组件之-----------交互模型组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## LongPressDraggable
> 可以使其子widget在长按时可拖动
- 构造函数
```javascript
LongPressDraggable({
    Key key,
    @required Widget child,// 被长按的对象组件
    @required Widget feedback,// 鼠标拖动时，显示的组件
    T data,
    Axis axis,
    Widget childWhenDragging,//拖动时的子项对象
    Offset feedbackOffset = Offset.zero,
    DragAnchor dragAnchor = DragAnchor.child,
    int maxSimultaneousDrags,
    VoidCallback onDragStarted,// 拖动开始回调
    DraggableCanceledCallback onDraggableCanceled,// 拖动取消回调
    DragEndCallback onDragEnd,// 拖动结束回调
    VoidCallback onDragCompleted,// 拖动完成时的回调
    this.hapticFeedbackOnStart = true,
    bool ignoringFeedbackSemantics = true,
  })

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("longpressdragable"),),
      body: Center(
        child: LongPressDraggable(
          child: RaisedButton(child: Text("press"),),
          // 鼠标拖动时，所移动的组件对象
          feedback: Container(child: Text("feedback"),),
          onDragStarted: (){
            print("ondragstarted.....................");

          },
          onDraggableCanceled: (a,d){
            print("$a,,,,,,,,,,,,,,,,,,,,,,,,,,,,$d,,,,,,ondraggablecanceled");
          },
          onDragCompleted: (){
            print("ondragcompleted.............");
          },
          onDragEnd: (e){
            print("$e................ondragend");
          },
          data: Text("data..."),//没看到啥变化
          // 拖动时  替换原child组件
          childWhenDragging: Text("childwhenDragging"),
        ),
      ),
    );
  }

}

```
## GestureDetector
> 一个检测手势的widget
- 构造函数
```javascript
GestureDetector({
    Key key,
    this.child,//子组件
    this.onTapDown,// 单击接触
    this.onTapUp,// 单击离开
    this.onTap,// 单击触发
    this.onTapCancel,//触发的onTapDown指针不会再触发单击事件
    this.onDoubleTap,//双击触发
    this.onLongPress,// 长按
    this.onLongPressUp,// 长按离开
    this.onVerticalDragDown,// 接触并可能开始垂直移动
    this.onVerticalDragStart,// 接触并开始垂直移动
    this.onVerticalDragUpdate,//接触并垂直移动
    this.onVerticalDragEnd,//接触并垂直移动结束
    this.onVerticalDragCancel,//先前触发onVerticalDragDown的指针未完成触发了取消。
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onPanDown,//指针已通过主按钮与屏幕接触，并可能开始移动
    this.onPanStart,//触摸点与屏幕接触，并已开始移动
    this.onPanUpdate,// 屏幕上的触摸点位置每次改变时，都会触发该回调
    this.onPanEnd,//先前通过主按钮与屏幕接触并且移动的指针不再与屏幕接触，并且当它停止接触屏幕时以特定速度移动
    this.onPanCancel,//先前触发onPanDown的指针未完成
    this.onScaleStart,//与屏幕接触的指针已建立焦点，初始比例为1.0
    this.onScaleUpdate,// 与屏幕接触的指针表示新的焦点和/或比例
    this.onScaleEnd,// 指针不再与屏幕接触
    this.behavior,
    this.excludeFromSemantics = false
  }) 


``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _operation = "No Gesture detected!"; 


    //更新文本
  void updateText(String text) {
    setState(() {
      _operation = text;
    });
    //提示
    showSnackBar(text);
  }

  // 底部弹层显示信息
  void showSnackBar(String message) {
    var snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.lightGreen,
        duration: Duration(milliseconds: 400));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("GestureDetectorTest"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
            child: Text(
              _operation,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
          ),
          onTap: () => updateText("onTap"), //单击
          onDoubleTap: () => updateText("onDoubleTap"), //双击
          onLongPress: () => updateText("onLongPress"), //长按
          // onTapDown: (e){
          //   print("tapdown....................");
          // },
          // onVerticalDragDown: (e){
          //   print("VerticalDragDown....................");
          // },
          // onPanDown: (e){
          //    print("pandown....................");
          // },
        ),
      ),
    );
  }

}


```
## DragTarget
> 一个拖动的目标widget，在完成拖动时它可以接收数据
- 构造函数
```javascript
Draggable({
    Key key,
    @required this.child,// 子项widget
    @required this.feedback,//正在拖动时，显示的widget
    this.data,//要传递的数据
    this.axis,//控制widget在拖动时，只能横向
    this.childWhenDragging,//拖动的时候，在原始位置展示的widget
    this.feedbackOffset = Offset.zero,
    this.dragAnchor = DragAnchor.child,
    this.affinity,
    this.maxSimultaneousDrags,
    this.onDragStarted,///开始拖拽
    this.onDraggableCanceled,//没有拖拽到DragTarget或拖拽没有完成的回调
    this.onDragEnd,///结束拖拽
    this.onDragCompleted, ///拖拽到DragTarget且接受的时候回调
    this.ignoringFeedbackSemantics = true,
})
DragTarget({
    Key key,
    @required this.builder,// target的创建者
    this.onWillAccept,//预判是否会接受这个Draggable
    this.onAccept,//接受Draggable的回调
    this.onLeave,//Draggable拖拽到上但是没有松开，直接离开的回调
})


``` 
- 应用示例
```javascript
class _DraggableWidgetPageState extends State<DraggableWidgetPage> {

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Draggable(
              data: 4,
              ///控制widget在拖动时，
              //axis: Axis.horizontal,
              ///停止的时候，显示的widget
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              ///正在拖动时，显示的widget
              feedback: Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ///拖动的时候，在原始位置展示的widget
              childWhenDragging: Container(
                width: 50,
                height: 50,
                child: Text("childWhenDragging"),
                color: Colors.grey,
              ),
              ///开始拖拽
              onDragStarted: () {
                print("----onDragStarted,开始拖拽");
              },
              ///拖拽到DragTarget且接受的时候回调
              onDragCompleted: () {
                print("----onDragCompleted,拖拽完成");
              },
              ///没有拖拽到DragTarget或拖拽没有完成的回调
              onDraggableCanceled: (v, offset) {
                print("----onDraggableCanceled,拖拽取消");
              },
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              child: DragTarget(
                builder: (context, List<int> candidateData,List<dynamic> rejectedData) {
                  ///candidateData，当Draggable被拖到DragTarget上的时候的data，已经准备好接受
                  print("----candidateData" + candidateData.toString());

                  ///rejectData，当Draggable被拖到DragTarget上的时候，不被接受
                  print("----rejectedData" + rejectedData.toString());

                  ///这两个数据都是正拖到上面的时候，还没放到上面，还没松手
                  return Center(
                    child: Text(candidateData.toString() +
                        "----" +
                        rejectedData.toString()),
                  );
                },
                ///接收Draggable的data数据，判断是否接收
                onWillAccept: (data) {
                  print("----onWillAccept,拖拽" + data.toString() + "到target");
                  if (data == 4) {
                    return true;
                  } else {
                    return false;
                  }
                },
                ///当拖到DragTarget的时候，松手后
                onAccept: (data) {
                  print("----onAccept,接收" + data.toString());
                  scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text(data.toString())));
                },
                ///拖到上面，没有松手，又离开
                onLeave: (data) {
                  print("----onLeave,离开" + data.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


```
## Dismissible
> 可以在拖动时隐藏的widget
- 构造函数
```javascript
Dismissible({
    @required Key key,
    @required this.child,// 子项
    this.background,//向右滑动背景色
    this.secondaryBackground,///向左滑动背景色
    this.onResize,//widget大小改变时的回调
    this.onDismissed,//大小改变完成后，widget隐藏时的回调
    this.direction = DismissDirection.horizontal,//隐藏widget的方向
    this.resizeDuration = const Duration(milliseconds: 300),
    this.dismissThresholds = const <DismissDirection, double>{},
    this.movementDuration = const Duration(milliseconds: 200),
    this.crossAxisEndOffset = 0.0,
  })

``` 
- 应用示例
```javascript
class _DraggableWidgetPageState extends State<DraggableWidgetPage> {

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Dismissible(
              key:ValueKey("myString"),
              child:ListTile(
                title:Text("dismissble"),
              ),
              // 向右滑动背景色
              background:Container(
                color:Colors.green,
              ),
              // 向左滑动背景色
              secondaryBackground: Container(
                color:Colors.red,
              ),
              onResize: (){
                print("onresize.............");
              },
              onDismissed: (e){
                 print("onDismissed.............$e");
              },
              

            ),
          ],
        ),
      ),
    );
  }
}


```
## Navigator
> 导航器，可以在多个页面(路由)栈之间跳转
- 构造函数
```javascript
Navigator({
    Key key,
    this.initialRoute,//初始路由
    @required this.onGenerateRoute,//路由生成器，
    this.onUnknownRoute,//OnGenerateRoute 无法生成路由时调用。
    this.observers = const <NavigatorObserver>[] // 此导航器的观察着列表
})

``` 
- 应用示例
```javascript
import 'package:flutter/material.dart';
// import 'package:test_flutter/customPaintView/chess_vectors_flutter.dart';

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
      initialRoute: '/',
       home: MyHomePage(),
      routes: {
        '/lgx': (BuildContext context) => HomePage(),
        '/signup': (BuildContext context) => SignUpPage(),
      },
    );
  }
}
// 主页面
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.red,
            onPressed: (){
                Navigator.pushNamed(context, "/lgx");
            },
            child: Text("lgx"),
          ),
           RaisedButton(
            color: Colors.green,
            onPressed: (){
                Navigator.pushNamed(context, "/signup");
            },
            child: Text("signup"),
          ),

        ],
      ),
    );
  }
}

// 路由lgx指向的页面
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lgx"),
        leading:IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () {Navigator.pop(context);},
         ),
      ),
      body:  DefaultTextStyle(
        style: Theme.of(context).textTheme.display1,
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Text('lgx'),
        ),
      ),
    );
  }
}

class CollectPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1,
      child: GestureDetector(
        onTap: () {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          Navigator.of(context)
              .pushReplacementNamed('signup/choose_credentials');
        },
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Text('Collect Personal Info Page'),
        ),
      ),
    );
  }
}

class ChooseCredentialsPage extends StatelessWidget {
  const ChooseCredentialsPage({
    this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignupComplete,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.display1,
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text('Choose Credentials Page'),
        ),
      ),
    );
  }
}

// 路由signup指向的页面
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SignUpPage builds its own Navigator which ends up being a nested
    // Navigator in our app.
    return Scaffold(
      appBar: AppBar(
        title: Text("sinup"),
        leading:IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () {Navigator.pop(context);},
         ),
      ),
      body: Navigator(
        initialRoute: 'signup/personal_info',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'signup/personal_info':
              // Assume CollectPersonalInfoPage collects personal info and then
              // navigates to 'signup/choose_credentials'.
              builder = (BuildContext _) => CollectPersonalInfoPage();
              break;
            case 'signup/choose_credentials':
              // Assume ChooseCredentialsPage collects new credentials and then
              // invokes 'onSignupComplete()'.
              builder = (BuildContext _) => ChooseCredentialsPage(
                    onSignupComplete: () {
                      // Referencing Navigator.of(context) from here refers to the
                      // top level Navigator because SignUpPage is above the
                      // nested Navigator that it created. Therefore, this pop()
                      // will pop the entire "sign up" journey and return to the
                      // "/" route, AKA HomePage.
                      Navigator.of(context).pop();
                    },
                  );
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}


```
## IgnorePointer
> 可以使其子widget在长按时可拖动
- 构造函数
```javascript


``` 
- 应用示例
```javascript


```
## AbsorbPointer
> 可以使其子widget在长按时可拖动
- 构造函数
```javascript


``` 
- 应用示例
```javascript


```

