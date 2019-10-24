import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'dart:math';


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
      home:MyStatePage(),
    );
  }
}

class MyStatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStatePageState();
  }
}
// 定义列表数据类型
class BaseBean {
  String name;
  int age;
  String content;
  BaseBean(this.name, this.age, this.content);
}
// 利用list.generate函数  构造列表数据集合
List<BaseBean> list = new List<BaseBean>.generate(
    60, (i) => new BaseBean("name$i", i, "content=$i"));

class MyStatePageState extends State<MyStatePage> {
  
  // listview 构造函数构建 
  Widget listViewLayout(){
    return ListView(
      scrollDirection: Axis.vertical,
      reverse: true,// true 子项集合倒序排列
      primary: false,// 似乎没毛用
      padding: EdgeInsets.all(20.0),
      // physics: NeverScrollableScrollPhysics(),// 滚动类型， 此处设置为不滚动
      children: <Widget>[
        Text('I\'m dedicating every day to you'),
        ListTile(title: Text("1"),),
        Text('Domestic life was never quite my style'),
        ListTile(title: Text("2"),),
        Text('When you smile, you knock me out, I fall apart'),
        ListTile(title: Text("3"),),
        Text('And I thought I was so smart'),
        ListTile(title: Text("4"),),
        ListTile(title: Text("5"),),
        ListTile(title: Text("6"),),
        ListTile(title: Text("7"),),
        ListTile(title: Text("8"),),
        ListTile(title: Text("9"),),
        ListTile(title: Text("11"),),
        ListTile(title: Text("12"),),
        ListTile(title: Text("13"),),

      ],
    );
  }

  // listView builder 构建视图列表
  Widget listViewLayoutBuilder(List<BaseBean> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,   // 主轴防线
        padding: EdgeInsets.all(10.0),
        reverse: false,
        primary: true,
        itemExtent: 50.0,// 每一个子项的高度
        shrinkWrap: true,// 内容适配
        itemCount: list.length,  // 子项数量   
        cacheExtent: 30.0, //预加载30条
        physics: new ClampingScrollPhysics(),// 此处设置股东类型为 包裹内容 不会有回弹
        //  controller ,// 滚动位置控制器
        // 创建子项widgets
        itemBuilder: (context, i) => new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(
                    "${list[i].name}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                  new Text(
                    "${list[i].age}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.green),
                  ),
                  new Text(
                    "${list[i].content}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                  ),
                ],
              ),
            ));
  }


  ///  listView separated 构建视图列表 用于多类型 分割
  Widget listViewLayoutSeparated(List<BaseBean> list) {
    return ListView.separated(
      itemCount: list.length,//子项数量
      // 创建分割子项的widgets
      separatorBuilder: (content, index) {
        //和itemBuilder 同级别的执行
        if (index == 2) {
          return new Container(
            height: 40.0,
            child: new Center(
              child: new Text("类型1"),
            ),
            color: Colors.red,
          );
        } else if (index == 7) {
          return new Container(
            height: 40.0,
            child: new Center(
              child: new Text("类型2"),
            ),
            color: Colors.blue,
          );
        } else if (index == 14) {
          return new Container(
            height: 40.0,
            child: new Center(
              child: new Text("类型3"),
            ),
            color: Colors.yellow,
          );
        } else {
          return new Container();
        }
      },
      // 创建子项widgets
      itemBuilder: (content, i) {
        return new InkWell(
          child: new Container(
              height: 30.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(
                    "${list[i].name}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                  new Text(
                    "${list[i].age}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.green),
                  ),
                  new Text(
                    "${list[i].content}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                  ),
                ],
              )),
          onTap: () {
            print("1111");
          },
        );
  //      return ;
      },
    );
  }

  ///listView custom 构建视图列表
  Widget listViewLayoutCustom(List<BaseBean> list) {
      return ListView.custom(
        itemExtent: 40.0,// 每个子项的高度
        // 构建子项的代理
        childrenDelegate: MyChildrenDelegate(
          (BuildContext context, int i) {
            return new Container(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  "${list[i].name}",
                  style: new TextStyle(fontSize: 18.0, color: Colors.red),
                ),
                new Text(
                  "${list[i].age}",
                  style: new TextStyle(fontSize: 18.0, color: Colors.green),
                ),
                new Text(
                  "${list[i].content}",
                  style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ],
            ));
          },
          childCount: list.length,
        ),
        cacheExtent: 0.0,
      );
    
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list body"),),
      // body:listViewLayout(),
      // body:listViewLayoutBuilder(list),
      // body:listViewLayoutSeparated(list),
      body:listViewLayoutCustom(list),
    );
  }
}

// 自定义listview布局的代理类
class MyChildrenDelegate extends SliverChildBuilderDelegate {
  MyChildrenDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive = true,
    bool addRepaintBoundaries = true,
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
  }

  // 可不重写 重写不能为null  默认是true  添加进来的实例与之前的实例是否相同 相同返回true 反之false
  // listView 暂时没有看到应用场景 源码中使用在 SliverFillViewport 中
  @override
  bool shouldRebuild(SliverChildBuilderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    // return super.shouldRebuild(oldDelegate);
    return this !=oldDelegate;
  }
}





