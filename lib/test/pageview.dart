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
  PageController pageController = new PageController();

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
          ///页面主体，PageView，用于承载Tab对应的页面
        body: new PageView(
          ///必须有的控制器，与tabBar的控制器同步
          controller: pageController,
//           ///每一个 tab 对应的页面主体，是一个List<Widget>
//           ///此处的每一个页面若是一个Statefulwidget组件时:
//           ///点击切换页面时，StatefulWidget 的子页面每次都会重新调用initState。若想不让initState执行，则需要AutomaticKeepAliveClientMixin此组件类  。
//           ///每个 Tab 对应的 StatefulWidget 的 State ，需要通过with AutomaticKeepAliveClientMixin ，然后重写 @override bool get wantKeepAlive => true;

          children: _datas.map(
            (String item){
              return Center(child: Text(item),);
            }
          ).toList(),
          onPageChanged: (index) {
            print(index.toString()+">>>>>>>>>>>>>>>>>>>>>>>>");
            // pageview页面变换时，通过tabController同步tab选中状态
            tabController.animateTo(index);
          },
        ),
        ///底部导航栏，也就是tab栏
        bottomNavigationBar: new Material(
          color: Colors.blueGrey,
          ///tabBar控件
          child: new TabBar(
            ///必须有的控制器，与pageView的控制器同步
            controller: tabController,
            ///每一个tab item，是一个List<Widget>
            tabs: _datas.map(
              (String item){ 
                return FlatButton(
                  onPressed: (){
                    print("object..........");
                    // 点击tab标签时，通过pageController控制器切换显示的页面
                    pageController.animateToPage( _datas.indexOf(item),
                     duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                    //也可以通过pageController.jumpTo 跳转页面，每个页面需要跳转坐标为：当前屏幕大小乘以索引 index 。
                  },
                  child: Tab(text: item,),
                );
              }
            ).toList(),
            ///tab底部选中条颜色
            indicatorColor: Colors.blue,
          ),
        )
      ),
    );
  }
  

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    tabController .dispose();
    pageController.dispose();
    super.dispose();
  }
}