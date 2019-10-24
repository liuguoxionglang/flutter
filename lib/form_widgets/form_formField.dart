import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => new _MyApp();
}

class _MyApp extends State<MyApp> {

  String _lastName;
  String _firstName;
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