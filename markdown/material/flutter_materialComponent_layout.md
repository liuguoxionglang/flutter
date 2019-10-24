# flutter material widget组件之-----------布局组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## ListTitle
> 一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标
- 构造函数
```javascript
 const ListTile({
    Key key,
    this.leading,//头部小部件
    this.title,//标题部件
    this.subtitle,//子标题部件
    this.trailing,//尾部部件
    this.isThreeLine = false,// 是否自适应显示三行文本
    this.dense,// 标题和子标题内容是否密集显示
    this.contentPadding,//标题部件内骗局
    this.enabled = true,//标题是否可操作
    this.onTap,//标题被操作后的回调
    this.onLongPress,//标题被长按时的回调函数
    this.selected = false,// 
  })
    
``` 
- 应用示例
```javascript
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  var _callback = (){
    print(",,,,,,,,,,,,object");
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: Center(
          child: ListView(
            children: const <Widget>[
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),//头部小部件
                  title: Text('Three-line ListTile'),//标题部件
                  //子标题部件
                  subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.fdsfdsfdsfdsfdsfdsfdffffffffffffffffffffffffffff'
                  ),
                  //尾部部件
                  trailing: Icon(Icons.more_vert),
                  // 是否自适应显示三行文本
                  isThreeLine: true,
                  // 标题和子标题内容是否密集显示
                  dense: true,
                  enabled: true,
                  // onTap: _callback,
                  // onLongPress: _callback,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


```
## Stepper
> 一个Material Design 步骤指示器，显示一系列步骤的过程
- 构造函数
```javascript
 Stepper({
    Key key,
    @required this.steps,//每一步的子组件
    this.type = StepperType.vertical,//主轴指示器的类型，垂直或者水平
    this.currentStep = 0,// 当前所在的子步骤
    this.onStepTapped,//点击每一步时的回调函数
    this.onStepContinue,//当continue按钮被点击时的回调
    this.onStepCancel,// 当cancel按钮被点击时的回调
    this.controlsBuilder,// 创建自定义的控制器
  })
  Step({
    @required this.title,// 每一步骤的标题
    this.subtitle,// 每一步骤的子标题
    @required this.content,// 每一步骤的内容
    this.state = StepState.indexed,//步骤的状态，决定其组件的样式和步骤是否是交互的。
    this.isActive = false,//子步骤是否处于活动状态
  }) 
    
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
         child: Stepper(
          //每一步的子组件
          steps: [
             Step(
               title: Text("第一步"),
               subtitle: Text("fist step"),
               content: Text("1.内容"),
               state: StepState.indexed,// 每一步的状态，有completed,editing等状态
               isActive: true // 是否处于激活状态，激活时，步骤指示器的样式会是有颜色的状态
             ),
             Step(
               title: Text("第2步"),
               content: Text("3.内容")
             ),
             Step(
               title: Text("第3步"),
               content: Text("3.内容")
             ),
             Step(
               title: Text("第4步"),
               content: Text("4.内容")
             ),
           ],
          type: StepperType.vertical,//主轴指示器的类型，垂直或者水平
          currentStep: 2,// 当前所展开显示的步骤
          //点击每一步时的回调函数
          onStepTapped: (val){
            print("............被点击的step......"+val.toString());
          },
          // 当cancel按钮被点击时的回调
          onStepCancel: (){
            print("cacel,,,,,,,,,,");
          },
          //当continue按钮被点击时的回调
          onStepContinue: (){
            print("continue................");
          },
          // 创建自定义的操作按钮
          controlsBuilder:  (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[
                  RaisedButton(
                  onPressed: onStepContinue,
                  child: const Text('Continue Message!'),
                  ),
                  RaisedButton(
                    onPressed: onStepCancel,
                    child: const Text('Cancel Message!'),
                  ),
                ],
              );
          },
         ),
        ),
      ),
    );
  }
}


```
## Divider
> 一个逻辑1像素厚的水平分割线，两边都有填充
- 构造函数
```javascript
Divider({
    Key key,
    this.height = 16.0, // 分割线的高
    this.indent = 0.0,//分隔符左侧的空格数量
    this.color//分隔符的颜色
}) 
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
              Text("data"),
              Divider(
                height: 50,//分隔符组件的高
                indent: 15,//分隔符左侧的空格数量
                color: Colors.blue,// 分隔符的颜色
              ),

            ],
          ),
        ),
      ),
    );
  }
}

```

