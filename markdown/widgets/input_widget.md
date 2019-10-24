# flutter widget组件之-----------表单组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## Form FormField
> Form: 一个可选的、用于给多个TextField分组的widget
> FormField: 一个单独的表单字段。此widget维护表单字段的当前状态，以便在UI中直观地反映更新和验证错误

- 构造函数
```javascript
Form({
    Key key,
    @required this.child, // 子部件
    this.autovalidate = false,//自动校验
    this.onWillPop,//允许否决用户关闭表单时的路由尝试
    this.onChanged,//变化时的回调函数
})
 FormField({
    Key key,
    @required this.builder,//创建者
    this.onSaved,//保存回调函数
    this.validator,//校验器
    this.initialValue,//初始值
    this.autovalidate = false,// 是否自动验证
    this.enabled = true,//表单是否可以接受到用户的输入
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

  String _lastName;
  String _firstName;
//   FormState为Form的State类，可以通过Form.of()或GlobalKey获得。我们可以通过它来对Form的子元素FormField进行统一操作,我们看看其常用的三个方法：
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _showMessage(String name) {
    showDialog<Null>(
        context: context,
        child: new AlertDialog(
            content: new Text(name),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text('确定')
              )
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('表单输入')
        ),
        // Form：用于将多个表单控件组合在一起的容器
        body: new Form(
            key: _formKey,
            autovalidate:true ,
            //变化时的回调函数
            onChanged: (){
              print('object..........');
            },
            // 子部件
            child: new Column(
                children: <Widget> [
                  FormField(
                    //构建子部件
                    builder: (FormFieldState field){
                      return TextFormField();
                    },
                    //初始值
                    initialValue: "100",
                    //保存回调函数
                    onSaved: (val){
                      print("...........formfield save...."+val.toString());
                    },
                    //校验器
                    validator: (val){
                      print("validator......."+val.toString());
                    },
                    // 是否自动验证
                    autovalidate: true,
                    //表单是否可以接受到用户的输入 没毛用呀
                    enabled: false, 
                  ),
                  // TextFieldd：包含输入的表单控件，每个表单字段都应该在FormField控件中
                  new TextFormField(
                      decoration:InputDecoration(labelText:'姓氏' ) ,
                      // onSaved：当通过Form.save()保存表单时调用的方法
                      onSaved: ( value) {
                        _lastName = value;
                      }
                  ),
                  new Row(
                      children: <Widget> [
                        new RaisedButton(
                            child: new Text('重置'),
                            onPressed: () {
                              // reset()：将此Form下的每个TextField重置为初始状态
                              _formKey.currentState.reset();
                              _showMessage('姓名信息已经重置');
                            }
                        ),
                        new RaisedButton(
                            child: new Text('提交'),
                            onPressed: () {
                              // save()：保存Form下的每个TextField
                              _formKey.currentState.save();
                              _showMessage('你的姓名是'+_lastName+_firstName);
                            }
                        )
                      ]
                  )
                ]
            )
        )
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
## RawKeyboardListener
> 每当用户按下或释放键盘上的键时调用回调的widget。
- 构造函数
```javascript
RawKeyboardListener({
    Key key,
    @required this.focusNode,
    @required this.onKey,
    @required this.child,
  }) 
 
``` 
- 应用示例
```javascript
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form textformfield"),),
      body: Center(
        child: Column(
          children: <Widget>[
            RawKeyboardListener(
              child: Text("data"),
              focusNode: FocusNode(),// 不知道怎么用呀
              // onKey: ,
            )
          ],
        ),
      ),
    );
  }
}

```
