# 初次认识flutter
## flutter的介绍
> Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。
> Flutter Widget采用现代响应式框架构建，这是从 React 中获得的灵感，中心思想是用widget构建你的UI。 Widget描述了他们的视图在给定其当前配置和状态时应该看起来像什么。当widget的状态发生变化时，widget会重新构建UI，Flutter会对比前后变化的不同， 以确定底层渲染树从一个状态转换到下一个状态所需的最小更改
> 跨平台 原生的用户界面 开源免费 
## flutter 之widget
> 在 Flutter 中，一切的显示都是 Widget 。Widget 是一切的基础，作为响应式的渲染，属于 MVVM 的实现机制。我们可以通过修改数据，再用setState 设置数据，Flutter 会自动通过绑定的数据更新 Widget 。 所以你需要做的就是实现 Widget 界面，并且和数据绑定起来。
> Widget 和 Widget 之间通过 child: 进行嵌套。其中有的 Widget 只能有一个 child，比如下方的 Container ；有的 Widget 可以多个 child ，也就是children:，比如` Column 布局。下方代码便是 Container Widget 嵌套了 Text Widget。
> Widget 分为 有状态 和 无状态 两种，在 Flutter 中每个页面都是一帧。无状态就是保持在那一帧。而有状态的 Widget 当数据更新时，其实是绘制了新的 Widget，只是 State 实现了跨帧的数据同步保存。
- StatelessWidget
    > 通过继承 StatelessWidget定义无状态的widget，重写build 方法返回一个布局好的控件。
    ```javascript
        class MyApp extends StatelessWidget {
            /*应用程序的根widget*/
            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                    title: 'Flutter Demo',
                    home: MyHomePage(title: 'Flutter Demo Home Page'),
                );
            }
        }

    ```
- StatefulWidget 
    > 通过继承 StatefulWidget定义有状态的widget，通过重写createState()方法，创建并返回一个state对象，state对象中对一些数据进行了管理，并实时的应用的组件上；state中主要声明了以下几个周期函数：
    - initState ：初始化，理论上只有初始化一次。
    - didChangeDependencies：在 initState 之后调用，此时可以获取其他 State 。
    - dispose ：销毁，只会调用一次。
    ```javascript
        class MyHomePage extends StatefulWidget {
            MyHomePage({Key key, this.title}) : super(key: key);

            final String title;
            /*重写createState()方法，返回转台对象*/
            @override
            _MyHomePageState createState() => _MyHomePageState();
        }
        /*定义一个状态类*/
        class _MyHomePageState extends State<MyHomePage> {
            int _counter = 0;

            void _incrementCounter() {
                /*调用setState()方法更新状态*/
                setState(() {
                     _counter++;
                });
            }
            /*构建ui界面，并使用状态对象中存放的数据*/
            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                        /*Here we take the value from the MyHomePage object that was created by
                        the App.build method, and use it to set our appbar title.*/ 
                        title: Text(widget.title),
                    ),
                    body: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Text('hello flutter'),
                                Text('You have pushed the button this many times:',),
                                Text('$_counter',style: Theme.of(context).textTheme.display1,),
                            ],
                        ),
                    ),
                    floatingActionButton: FloatingActionButton(
                        onPressed: _incrementCounter,
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                    ), 
                );
            }
        }
    ```
## flutter 之hello world
> 运用statefullWidget创建一个由状态组件，调用MyHomePage组件时，以参数方式传递hellow world flutter!!!字符串，并渲染到组件上；
```javascript
    import 'package:flutter/material.dart';
    //主函数（入口函数），下面我会简单说说Dart的函数
    void main() =>runApp(MyApp());
    // 声明MyApp类
    class MyApp extends StatelessWidget{
        //重写build方法
        @override
        Widget build(BuildContext context) {
            //返回一个Material风格的组件
            return MaterialApp(
                title: 'Flutter Demo',
                home: MyHomePage(title: 'hello world flutter!!!'),
            );
        }
    }
    // 声明有状态类MyHomePage
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
                 //创建一个Bar，并添加文本
                appBar:AppBar(
                    title:Text('Welcome to Flutter'),
                ),
                //在主体的中间区域，添加一个hello world 的文本
                body:Center(
                    child:Text(widget.title),
                ),
           
        }
    }
```
