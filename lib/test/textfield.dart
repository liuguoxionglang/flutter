import 'package:flutter/material.dart';
void main(){runApp(LoginPage());}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{

  final GlobalKey<ScaffoldState> _scanoldkey = new GlobalKey<ScaffoldState>();

  /*...........................................................................登录页面.............................*/
  // textfield 文本编辑控制器   
  TextEditingController loginUserNameController = new TextEditingController();
  TextEditingController loginPwdController = new TextEditingController();

    // 密码输入是否模糊显示 默认模糊显示
  bool _obscureLoginPwdText = true;
  // bool _obscureLoginPwdConfrimText = true;
  
  
  // textfield focusnode 
  final FocusNode userNameFocusNode = new FocusNode();
  final FocusNode pwdFocusNode = new FocusNode();

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        key:_scanoldkey ,
        body:Card(
                  child: Container(
                    width: 300,
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                          child: TextField(
                            focusNode: userNameFocusNode, // 聚焦控制 自动切换聚焦
                            controller: loginUserNameController ,// 控制器，
                            keyboardType: TextInputType.text, // 键盘类型
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            // 此输入框的样式控制
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.verified_user,
                                color: Colors.black,
                                size: 18,
                                
                              ),
                              hintText: "用户名",
                              hintStyle: TextStyle(fontSize: 16),
                              border: InputBorder.none
                            ),
                          ),

                        ),
                        Container(height: 1,width: 250,color: Colors.grey[400],),
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                          child: TextField(
                            focusNode: pwdFocusNode,
                            controller: loginPwdController ,
                            keyboardType: TextInputType.text,
                            obscureText: _obscureLoginPwdText,
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.black,
                                size: 18, 
                              ),
                              hintText: "密码",
                              hintStyle: TextStyle(fontSize: 16),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: (){},
                                child: Icon(
                                  Icons.panorama_fish_eye,
                                  size:16,
                                  color:Colors.black
                                ),
                              )
                            ),
                          ),
                        ),

                      ],
                      
                    ),
                  ),

                )
      ),
    );
  }

}