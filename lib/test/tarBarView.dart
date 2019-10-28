import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

//Tab页的切换搭配了动画，因此到State类上附加一个SingleTickerProviderStateMixin
class MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {

  final  _datas = ["java","vue","react","js"];
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TabController中的vsync和length不能为空，
    tabController = new TabController(
      vsync: this, //动画效果的异步处理，默认格式，
      length: _datas.length
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "tabberview",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("tabberview"),
          //在appbar中也可以实现tabbar，不过appbar中的bottom选项 需要返回一个preferredsizewidget类型的widgets,所以此处使用它的实现类PreferredSize包裹TabBar实现
          // bottom:  PreferredSize(
          //   child: TabBar(
          //       indicatorColor: Colors.white,
          //       labelStyle: TextStyle(fontSize: 20,color: Colors.red),
          //       unselectedLabelStyle: TextStyle(fontSize: 16),
          //       controller: tabController,
          //       tabs: _datas.map(
          //         (String item){
          //           return Tab(text:item);
          //         }
          //       ).toList(),
          //   ),
          // ),
        ),
        body: Column(
          children: <Widget>[
            // 直接在此处实现tabbar，在此处可以设置container的颜色与主题颜色一致
            Container(
              height: 40,
              color: Colors.blue,
              child: TabBar(
                  indicatorColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 20,color: Colors.red),
                  unselectedLabelStyle: TextStyle(fontSize: 16),
                  controller: tabController,
                  tabs: _datas.map(
                    (String item){
                      return Tab(text:item);
                    }
                  ).toList(),
              ),
            ),
            Expanded(
              // 此处使用tabBarview展示每个tab标签的内容
              child: TabBarView(
                controller: tabController,
                children: _datas.map(
                  (String item){
                    return Container(child: Text(item),);
                  }
                ).toList()
              ),
            )

          ],
        ),

      ),
    );
  }
  

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    tabController .dispose();
    super.dispose();
  }
}