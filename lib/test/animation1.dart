import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';

void main(){runApp(myapp());}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(home: Start(),);
  }
  
} 

class Start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StartState();
  }
}

// 由于只有一个动画控制器，因此 使用SingleTickerProviderStateMixin即可
class StartState extends State<Start> with SingleTickerProviderStateMixin {

  AnimationController colorController;// 动画控制器
  Animation colorAnimation; // 闪屏动画

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 实例化动画控制器  
    colorController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    
    // 创建动画，动画控制器的drive方法返回一个动画示例，并将tween与动画关联
    // 此处给动画添加监听器，等待动画结束时，进行其他操作
    // 使用tween的实现类colorTween指定动画的区间，此处指定了动画的颜色变化区间
    colorAnimation = colorController
        .drive(ColorTween(begin: Color(0xFFFF786E), end: Color(0xFFFFA07A)))
          ..addListener(() {
            if (colorController.isDismissed) { //没有使用
               print("...............加载了。。。。");
               Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) =>LoginPage()), 
                  (route) => route == null
                );
            }
            // 更新渲染页面
            setState(() {});
          });

//    colorAnimation =
//        new ColorTween(begin: Color(0xFFFF786E), end: Color(0xFFFFA07A))
//            .animate(colorController)
//              ..addListener(() {
//
//              });

    playAnimation();
  }

// 开始播放动画
  Future<Null> playAnimation() async {
    try {
      await colorController.forward();// 动画正向进行
      await colorController.reverse();// 动画反向进行
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
                  body: Container(
                    // 此处必须将写好的动画应用到组件上，此处将动画的值应用于整个container上
                    decoration: BoxDecoration(color: colorAnimation.value),
                    child: Center(
                      child: new Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                              // child: new SvgPicture.asset("../../assets/logo.svg",
                              //     width: 50, height: 50, semanticsLabel: 'Acme Logo'),
                            child: new Image.asset(
                              "assets/app_logo.png",
                              width: 50,
                              height: 50,
                            ),
                            ),
                            Text(
                              "Hello SomeOne!",
                              style: TextStyle(fontSize: 28, color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Wrap(
                                children: <Widget>[
                                  Icon(
                                    Icons.filter_tilt_shift,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Welcome to AnJoiner~ ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Here, you can see the world that is different!",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                  ),
                );
  
  }

  @override
  void dispose() {
    // 销毁动画控制器
    // TODO: implement dispose 
    colorController.dispose();
    super.dispose();
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {

  final _loginKey = GlobalKey<ScaffoldState>();

  Color colorRegular = Color(0xFFFF786E);
  Color colorLight = Color(0xFFFF978F);
  Color colorInput = Color(0x40FFFFFF);
  Color colorWhite = Colors.white;

  TextStyle defaultTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  BorderRadius radius = BorderRadius.all(Radius.circular(21));
  // 动画控制器
  AnimationController _animationController; 
  // 定义动画
  Animation _buttonLengthAnimation;

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _codeController = new TextEditingController();

  bool isLogin = false;

  void showTips(String msg) {
    _loginKey.currentState.showSnackBar(new SnackBar(content: Text(msg,
      style: TextStyle(color: colorRegular,fontWeight: FontWeight.bold),),
      duration: new Duration(seconds: 3),backgroundColor: colorWhite,));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 实例化动画控制器
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
   
    // 按钮长度的变化动画
    _buttonLengthAnimation = new Tween<double>(
      begin: 312.0,
      end: 42.0,
    ).animate(new CurvedAnimation(
        parent: _animationController, curve: new Interval(0.0, 0.250)))
      ..addListener(() {
        // 监听动画，动画完成时
        if (_buttonLengthAnimation.isCompleted) {
          // 若已经验证通过，则路由跳转到指定页面，苟泽显示登陆失败即可
          if(isLogin){
            Navigator.pushNamedAndRemoveUntil(context, "list_page",ModalRoute.withName('login_page'));
          }else{
            showTips("登录失败");
          }
        }
        setState(() {});
      });
  }

  // 登陆方法
  void login() {
    String phone = _phoneController.text;
    String code = _codeController.text;
    isLogin = phone == "18200000000" && code == "123456";
    playAnimate(isLogin);
  }
  // 播放动画
  Future<Null> playAnimate(bool isLogin) async {
    try {
      if (isLogin) {
        await _animationController.forward();
      } else {
        await _animationController.forward();
        await _animationController.reverse();
      }
    } on TickerCanceled {
      // 自己处理动画取消
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _loginKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colorLight, colorRegular],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(top: 110, bottom: 39, left: 24, right: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                  color: colorInput),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    border: InputBorder.none,
                    hintText: "输入手机号",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
                maxLines: 1,
                cursorColor: colorRegular,
                keyboardType: TextInputType.phone,
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
              decoration:
                  BoxDecoration(borderRadius: radius, color: colorInput),
              child: TextField(
                controller: _codeController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    border: InputBorder.none,
                    hintText: "输入密码",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
                maxLines: 1,
                cursorColor: colorRegular,
                keyboardType: TextInputType.number,
                obscureText: true,
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
              ),
            ),
            InkWell(
              onTap: login,
              // 此处应用动画到组件上
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 42,
                width: _buttonLengthAnimation.value,
                decoration:
                    BoxDecoration(borderRadius: radius, color: colorWhite),
                alignment: Alignment.center,
                child: _buttonLengthAnimation.value > 75
                    ? new Text("立即登录",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorRegular))
                    : CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(colorRegular),
                        strokeWidth: 2,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child:
                Text("登录/注册即代表您已同意《会员协议》",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 销毁动画控制器
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}