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

  // 构建子项
  Widget BuildItem(BaseBean item){
    return Container(
      child:Column(
        children: <Widget>[
           new Text(
            "${item.name}",
            style: new TextStyle(fontSize: 18.0, color: Colors.green),
          ),
          new Text(
            "${item.age}",
            style: new TextStyle(fontSize: 18.0, color: Colors.red),
          ),
         
        ],
      ),
                  
    );
  }
  
  // gridview 构造函数构建 
  Widget GridViewLayout(){
    return GridView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(20.0),
      // 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ), 
      children:list.map((item)=>BuildItem(item)).toList(),
    );
  }

  // gridView builder 构建视图列表
  Widget gridViewLayoutBuilder(List<BaseBean> list) {
    return GridView.builder(
        scrollDirection: Axis.vertical,   // 主轴防线
        padding: EdgeInsets.all(10.0),
        itemCount:list.length,// 标明list的长度，不然报错
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ) ,
        // 创建子项widgets
        itemBuilder: (context, i) => new Container(
          child: new Row(
            children: <Widget>[
              new Text(
                "${list[i].name}",
                style: new TextStyle(fontSize: 18.0, color: Colors.red),
              ),
            ],
          ),
        ));
  }


  ///  gridView count 构建视图列表 
  Widget gridViewLayoutCount(List<BaseBean> list) {
    return GridView.count(
      crossAxisCount: 5,//列数
      padding: EdgeInsets.symmetric(vertical: 0),
      children: list.map((item)=>BuildItem(item)).toList()
    );
  }

  ///  gridView extent 构建视图列表 
  Widget gridViewLayoutExtent(List<BaseBean> list) {
    return GridView.extent(
      maxCrossAxisExtent: 200,// 子项组件大小
      children: list.map((item)=>BuildItem(item)).toList()
    );
  }

  /// gridView custom 构建视图列表
  Widget gridViewLayoutCustom(List<BaseBean> list) {
      return GridView.custom(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
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
            
              ],
            ));
          },
          childCount: list.length,
        ),
      
      );
    
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list body"),),
      //  body:GridViewLayout(),
      // body:gridViewLayoutBuilder(list),
      // body:gridViewLayoutCount(list),
      // body: gridViewLayoutExtent(list),

      body:gridViewLayoutCustom(list),
    );
  }
}

// 自定义gridview布局的代理类
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





