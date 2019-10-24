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

class MyStatePageState extends State<MyStatePage> {
  final _tabs = <String>['TabA', 'TabB'];
  final colors = <Color>[Colors.red, Colors.green, Colors.blue, Colors.pink, Colors.yellow, Colors.deepPurple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
                    SliverOverlapAbsorber(
                      // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      child: SliverAppBar(
                        pinned: true,
                        title: Text('NestedScroll Demo'),
                        expandedHeight: 200.0,
                        flexibleSpace: FlexibleSpaceBar(background: Image.asset('assets/images/4.jpg', fit: BoxFit.cover)),
                        bottom: TabBar(tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 18.0))).toList()),
                        forceElevated: innerScrolled,
                      ),
                    )
                  ],
              body: TabBarView(
                  children: _tabs
                      // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
                      // NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                      .map((tab) => Builder(
                            builder: (context) => CustomScrollView(
                                  // key 保证唯一性
                                  key: PageStorageKey<String>(tab),
                                  slivers: <Widget>[
                                    // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                                    SliverOverlapInjector(
                                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                                    SliverGrid(
                                        delegate: SliverChildBuilderDelegate(
                                            (_, index) => Image.asset('assets/images/2.jpg'),
                                            childCount: 8),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0)),
                                    SliverFixedExtentList(
                                        delegate: SliverChildBuilderDelegate(
                                            (_, index) => Container(
                                                child: Text('$tab - item${index + 1}',
                                                    style: TextStyle(fontSize: 20.0, color: colors[index % 6])),
                                                alignment: Alignment.center),
                                            childCount: 15),
                                        itemExtent: 50.0)
                                  ],
                                ),
                          ))
                      .toList()))),
    );
  } 
}







