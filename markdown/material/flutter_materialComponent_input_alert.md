# flutter material widget组件之-----------输入框、选择框、弹出框等
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## TextField
> 文本输入框
- 构造函数
```javascript
    TextField({
    Key key,
    this.controller, //控制器
    this.focusNode, //定义了此小部件的键盘焦点 ，应用没搞清楚
    this.decoration = const InputDecoration(),//装饰器
    TextInputType keyboardType, // 键盘类型
    this.textInputAction,//用于键盘的操作按钮的类型
    this.textCapitalization = TextCapitalization.none,// 文本大小写
    this.style, //样式
    this.textAlign = TextAlign.start,//文本居中方式
    this.textDirection,//文本方向
    this.autofocus = false,//是否自动聚焦
    this.obscureText = false,
    this.autocorrect = true,// 是否为模糊文本,通常密码输入时设置为true
    this.maxLines = 1,
    this.maxLength, // 最大长度
    this.maxLengthEnforced = true,// 是否强制按最大长度
    this.onChanged, // 值变换时的回调函数
    this.onEditingComplete,// 编辑完成时的回调
    this.onSubmitted, // 提交时的回调
    this.inputFormatters,// 格式化，可以有多个方式
    this.enabled,//是否可用
    this.cursorWidth = 2.0,//光标宽度
    this.cursorRadius,//光标圆角
    this.cursorColor,//光标颜色
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.onTap,// 用户点击此文本字段时的回调函数
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
       child: TextField(
          obscureText: false,// 是否为模糊文本,通常密码输入时设置为true
          focusNode: FocusNode(), //定义了此小部件的键盘焦点 ，应用没搞清楚
          textCapitalization: TextCapitalization.characters,// 每个字符大写
          //input装饰器
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          style: TextStyle(color: Colors.red),//样式
          textAlign: TextAlign.justify,//文本居中方式
          textDirection: TextDirection.rtl,// 文本方向，此处从右到左
          maxLength: 10,// 最大长度
          //值发生变化时的回调
          onChanged: (s){},
          cursorColor: Colors.green,//光标颜色
          onTap: (){},// 用户点击此文本字段时的回调函数
        )
      )
    
    );
  }
}

     
``` 
## Checkbox Radio Switch Slider
> Checkbox:复选框，允许用户从一组中选择多个选项。
> Radio: 单选框，允许用户从一组中选择一个选项。
> Switch: On/off 用于切换一个单一状态
> Slider: 滑块，允许用户通过滑动滑块来从一系列值中选择
- 构造函数
```javascript
    Checkbox({
        Key key,
        @required this.value, //复选框的值，true为选中，false为未选中
        this.tristate = false,//若其值为false,则value不能为null，若其值为true,则value可以为true，false,或者null
        @required this.onChanged,//选中变化时的回调
        this.activeColor,// 选中时填充的颜色
        this.materialTapTargetSize,//材料模型匹配目标尺寸
    })
    Radio({
        Key key,
        @required this.value,//单元框的值，
        @required this.groupValue,// 单选按钮组的选定值
        @required this.onChanged,//选中变化时的回调
        this.activeColor,// 选中时填充的颜色
        this.materialTapTargetSize,//材料模型匹配目标尺寸
    })
    Switch({
        Key key,
        @required this.value,//复选框的值，true为选中，false为未选中 不能为null
        @required this.onChanged,//选中变化时的回调
        this.activeColor,// 选中时填充的颜色 即选中时圆形球球的颜色
        this.activeTrackColor,// 选中时动态轨迹的颜色,即选中时球球轨道的颜色
        this.inactiveThumbColor,//未选中时的填充颜色，即未选中时的球球颜色
        this.inactiveTrackColor,//取消选中时的轨道颜色
        this.activeThumbImage, // 选中球球图片
        this.inactiveThumbImage,// 未中球球图片
        this.materialTapTargetSize,//材料模型匹配目标尺寸
    })
    Slider({
        Key key,
        @required this.value, // 滑动块的值，double类型
        @required this.onChanged,//变化时的回调
        this.onChangeStart,//开始变化时的回调
        this.onChangeEnd,//结束变化时的回调
        this.min = 0.0,//最小值
        this.max = 1.0,// 最大值
        this.divisions,// 离散分区的树木
        this.label,//标签
        this.activeColor,//滑动块经过的轨道颜色
        this.inactiveColor,//滑动块未经过的轨道颜色
        this.semanticFormatterCallback,// 格式化滑块值得回调函数。
    })
   
```
- 应用示例
```javascript
/*同上部分代码省略*/
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child:Column(
          children: <Widget>[
            Checkbox(
              value: false,//复选框的值，true为选中，false为未选中
              tristate: true,
              onChanged: (a){},//选中变化时的回调
              activeColor: Colors.red,//// 选中时填充的颜色
            ),
            Radio(
              value: 1,//单元框的值，
              groupValue: 2,// 单选按钮组的选定值 当此值与value值相同时，则此单选按钮被选中
              onChanged: (val){},// 选中变化时的回调
              activeColor: Colors.green,//选中时的填充颜色
            ),
            Switch(
              value: false,//复选框的值，true为选中，false为未选中 不能为null
              onChanged: (val){},//选中变化时的回调
              activeColor: Colors.greenAccent,//选中时圆形球球的颜色
              activeTrackColor: Colors.lightBlue,//选中时球球轨道的颜色
              inactiveTrackColor: Colors.black,//取消选中时的轨道颜色
              inactiveThumbColor: Colors.red,//未选中时的球球颜色

            ),
            Slider(
              value: 0.1,// 滑动块的值，double类型
              onChanged: (val){
                print("111......................"+val.toString());
              },
              onChangeStart: (val){
                print("start...................."+val.toString());
              },
              onChangeEnd: (val){
                print("end......................."+val.toString());
              },
              divisions: 1,
              label: "aa",//滑动块提示标签
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              semanticFormatterCallback: (val){
                return '${val.round()} .............dollars';
              },

            )
          ],
        )
        
      )
    
    );
  }
}

``` 

## Date 和 Time Picker
> 日期  时间选择控件，搞的不太清楚
- 构造函数
```javascript
    showDatePicker({
        @required BuildContext context,//上下文
        @required DateTime initialDate,//初始日期
        @required DateTime firstDate,//开始日期
        @required DateTime lastDate,//结束日期
        SelectableDayPredicate selectableDayPredicate,// 可选择日期预期回调，没搞清楚
        DatePickerMode initialDatePickerMode = DatePickerMode.day,// 日期选择方式，
        Locale locale,//国际化，
        TextDirection textDirection,//文本方向
    })
    showTimePicker({
        @required BuildContext context,//上下文
        @required TimeOfDay initialTime // 初始化时间
    })
   
```
- 应用示例
```javascript
class _MyHomePageState extends State<MyHomePage> {
    var _time="aa";
    var _date ="aa";

    _showDataPicker () async  {
        // Locale myLocale = Localizations.localeOf(context);
        var picker = await showDatePicker(
        context: context,//上下文
        initialDate: DateTime.now(),//初始日期
        firstDate: DateTime(2016),//开始日期
        lastDate: DateTime(2019),//结束日期
        // locale: myLocale
        );
        setState(() {
        _date = picker.toString();
        });
    
    }

    _showTimePicker() async {
        var picker =
            await showTimePicker(
            context: context, //上下文
            initialTime: TimeOfDay.now()// 初始化时间
            );
        setState(() {
        _time = picker.toString();
        });
    }

    @override
    Widget build(BuildContext context) {
        
        return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
        ),
        body:Center(
            child: Column(
                children: <Widget>[
                RaisedButton(
                    child: Text("选择日期"),
                    onPressed: ()=>_showDataPicker()
                ),
                Text(_date),
                RaisedButton(
                    child: Text("选择时间"),
                    onPressed: ()=>_showTimePicker()
                ),
                Text(_time),
            ],
            )
            
        )
        
        );
    }
}    
``` 
## SimpleDialog
> 简单对话框可以显示附加的提示或操作
- 构造函数
```javascript
    SimpleDialog({
        Key key,
        this.title,//标题
        this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),//标题内边距
        this.children,// 子项控件
        this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),//子组件内边距
        this.semanticLabel,//语义化的标签
        this.shape,//形状
    })
    SimpleDialogOption({
        Key key,
        this.onPressed, // 单击回调
        this.child,//子项控件的内容
    })
   
```
- 应用示例
```javascript
/*省略相同代码*/
class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
         child: Column(
            children: <Widget>[
              SimpleDialog(
                title: const Text('Select assignment'),//标题
                titlePadding: EdgeInsets.fromLTRB(24, 24, 24, 24),//标题内边距
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),//子项内边距
                semanticLabel: "ddd",//语义化的标签  好像没作用？？
                shape:CircleBorder(side: BorderSide(color: Colors.red)),//弹框形状
                // 子项组件
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {  },
                    child: const Text('Treasury department'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {Navigator.pop(context, -1); },// 单击回调
                    child: const Text('State department'),//子项控件的内容
                  ),
                  Container(
                    child: Center(
                      child: Text("data"),
                    ),
                  )
                ],
              ),
             
             
           ],
         )
        
      )
    
    );
  }
}

     
```
## AlertDialog
> 一个会中断用户操作的对话款，需要用户确认
- 构造函数
```javascript
    AlertDialog({
        Key key,
        this.title,//弹框标题
        this.titlePadding,//标题内边距
        this.content,//正文内容
        this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),//内容内边距
        this.actions,//弹框中的操作组件，比如确认，取消等按钮操作
        this.semanticLabel,//语义化标签
        this.shape,//弹框形状
    })
   
```
- 应用示例
```javascript
class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: new Builder(
          builder: (BuildContext context) {
            return new RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: Text("提示"),
                      content: new Text("我是AlertDialog"),//弹框显示的内容
                      // //弹框中的操作组件，比如确认，取消等按钮操作
                      titlePadding: EdgeInsets.all(12),
                      contentPadding: EdgeInsets.all(2),
                      semanticLabel: "a",
                      // shape: ,
                      actions: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text('确定'))
                      ],
                  ));
                },
                child: new Text("Dialog出来"),
                color: Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                disabledColor: Colors.lightBlueAccent);
          }),
        
      )
    
    );
  }
}

     
```
## BottomSheet
> BottomSheet是一个从屏幕底部滑起的列表（以显示更多的内容）。你可以调用showBottomSheet()或showModalBottomSheet弹出
- 构造函数
```javascript
    Future<T> showModalBottomSheet<T>({
        @required BuildContext context,// 执行上下文
        @required WidgetBuilder builder,// widget的创建函数
    })
   
```
- 应用示例
```javascript
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

     
``` 
## ExpansionPanel
> 扩展面板包含创建流并允许对元素进行轻量级编辑。expansionpanel小部件实现了这个组件。
- 构造函数
```javascript
 ExpansionPanelList({
    Key key,
    this.children = const <ExpansionPanel>[],//面板子项列表
    this.expansionCallback, // 展开面板时的回调函数
    this.animationDuration = kThemeAnimationDuration,// 切换动画时间
  })
  ExpansionPanel({
    @required this.headerBuilder, // 标题组件的构建函数
    @required this.body, // 扩展主体内容
    this.isExpanded = false// 面板是否展开
  })
   
```
- 应用示例
```javascript
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: ExpansionPanelListDemo(),
  ));
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}
// 创建expand状态bean对象
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1; //当前打开的面板
  List<int> mList; // 面板序号列表
  List<ExpandStateBean> expandStateList; // 面板状态列表

  // 构造函数
  _ExpansionPanelListDemoState() {
    mList = new List();
    expandStateList=new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  // 面板展开切换时的回调函数
  _setCurrentIndex(int index,isExpand) {
    setState(() {
      expandStateList.forEach((item){
        if (item.index==index) {
          item.isOpen=!isExpand;
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ExpansionPanelList"),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            //面板子项列表
            children: mList.map((index) {
              return new ExpansionPanel(
                // 标题组件的构建函数
                headerBuilder: (context, isExpanded) {
                  return new ListTile(
                    title: new Text('我是第$index个标题'),
                  );
                },
                // 扩展主体内容
                body: new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(height: 100.0,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child:Icon(Icons.security,size: 35.0,),),
                ),
                // 面板是否展开
                isExpanded: expandStateList[index].isOpen,
              );
            }).toList(),
            // 展开面板时的回调函数
            expansionCallback: (index, bol) {
              _setCurrentIndex(index,bol);
            },
            // 切换动画时间
            animationDuration: Duration(microseconds: 100),

        ),));
  }
}
     
```
## SnackBar
> 具有可选操作的轻量级消息提示，在屏幕的底部显示。为了显示snackbar, 通常会调用 Scaffold.of(context).showSnackBar()传递一个带有描述信息的snackbar实例.
- 构造函数
```javascript
SnackBar({
    Key key,
    @required this.content,//内容
    this.backgroundColor,//背景
    this.action,//其他操作，snackBarAction
    this.duration = _kSnackBarDisplayDuration,//显示时长
    this.animation,// 进出动画
  })
   
```
- 应用示例
```javascript
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      home: new MaterialApp(
        home: new MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("SnackBar"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context) {
            return new RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      content: new Text("Snackbar"), //内容
                      action: new SnackBarAction(
                        label: "撤回",
                        onPressed: () {},
                      ), // 其他操作
                      backgroundColor:Colors.orange,//背景色
                      duration : Duration(microseconds: 500,minutes: 1), //  显示时长
                      //animation:,// 进出动画
                ));
              },
              child: new Text("点我啊"),
              color: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              disabledColor: Colors.lightBlueAccent,
            );
          }),
        ));
  }
}
     
```    