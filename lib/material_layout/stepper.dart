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