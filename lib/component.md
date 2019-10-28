# 组件学习
[flutter基础视频学习资源](https://juejin.im/post/5c1c5c1a6fb9a049f43b4944)
[Flutter实战官网地址](https://book.flutterchina.club/)

## MediaQuery
> MediaQuery 用于查询解析给定数据的媒体信息（例如，window宽高/横竖屏/像素密度比 等信息）官方提供这个组件让开发者可以获取想要的数据。它主要用于不同尺寸大小设备的适配
> 使用MediaQuery必须要MaterialApp 或者WidgetsApp 去包裹我们的Widget，这样才能够提供正常使用它，否则会出现错误:Flutter Error: MediaQuery.of() called with a context that does not contain a MediaQuery。
> 另外，在当前小部件中使用了上一个小部件的 context，来调用 MediaQuery.of(context) 获取数据的时候，也会出现上述错误
> 使用MediaQuery.of方法，可以获取给定BuildContext的当前MediaQueryData。例如，要获取当前window的大小，可以使用MediaQuery.of(context).size
> 除了MediaQuery以外，实际上我们也可以通过GlobalKey来获取该widget的size。大家有兴趣也可以去了解通过GlobalKey的获取宽高的方式
[MediaQuery参考文章](https://juejin.im/post/5b6cfcade51d451915575b7b#heading-21)
 
## Buildcontext
> BuildContext,顾名思义，Build（构建Widget） Context（应用上下文），就是构建Widget中的应用上下文。所以BuildContext只出现在两个地方：
1. StatelessWidget.build 方法中：创建StatelessWidget的build方法
2. State对象中：一个是创建StatefulWidget的State对象的build方法中，另一个是State的成员变量
> BuildContext实际是Element,BuildContext是为了阻止直接对Element操作而抽象出来的，所以BuildContext是Element的抽象类，所有Element都继承自BuildContext。每一个Widget都有一个BuildContext。
> BuildContext是Widget在Widget树中位置的句柄
### 访问 BuildContext 实例对象
> BuildContext被WidgetBulder（例如：StatelessWidget.build, State.build）方法传递；
> BuildContext也是State的成员变量，在State内部，可以通过context直接访问
> BuildContext对象实际上就是Element对象，BuildContext 接口用于阻止对 Element 对象的直接操作
### BuildContext 使用
> BuildContext的作用主要是通过上下文获取指定的数据；
> 例如：Theme.of(context) 或者 showDialog(context: context,....)都需要BuildContext作为参数，这里的BuildContext就是调用这些方法的Widget的代表
### BuildContext 注意事项
> 每一个Widget都有一个BuildContext。假设有个A Widget，A Widget里肯定会有StatelessWidget.build或者State.build的build方法，build方法创建了 B Widget并返回，A Widget就是B Widget的父Widget，相应的， A Widget的BuildContext也是是B Widget 的BuildContext的父节点
### BuildContext 内部方法解析
- ancestorInheritedElementForWidgetOfExactType(Type targetType) → InheritedElement
- ancestorRenderObjectOfType(TypeMatcher matcher) → RenderObject
- ancestorStateOfType(TypeMatcher matcher) → State
- ancestorWidgetOfExactType(Type targetType) → Widget
- findRenderObject() → RenderObject
- inheritFromElement(InheritedElement ancestor, { Object aspect }) → InheritedWidget
- inheritFromWidgetOfExactType(Type targetType, { Object aspect }) → InheritedWidget 
### Flutter如何构建视图
> 在Flutter中，Everything is Widget，我们通过构造函数嵌套Widget来编写UI界面。实际上，Widget并不是真正要显示在屏幕上的东西,只是一个配置信息，它永远是immutable的，并且可以在多处重复使用。那真正显示在屏幕上的视图树是什么呢？Element Tree！
> 视图树装载过程
1. StatelessWidget
> 首先它会调用StatelessWidget的 createElement 方法，并根据这个widget生成StatelesseElement对象。
> 将这个StatelesseElement对象挂载到element树上。
> StatelesseElement对象调用widget的build方法，并将element自身作为BuildContext传入。
2. StatefulWidget
> 首先同样也是调用StatefulWidget的 createElement方法，并根据这个widget生成StatefulElement对象，并保留widget引用。
> 将这个StatefulElement挂载到Element树上。
> 根据widget的 createState 方法创建State。
> StatefulElement对象调用state的build方法，并将element自身作为BuildContext传入。
> 所以我们在build函数中所使用的context，正是当前widget所创建的Element对象

[参考地址](https://juejin.im/post/5c665cb651882562914ec153)


## navigator 
> 通常我们我们在构建应用的时候并没有手动去创建一个Navigator，也能进行页面导航，这又是为什么呢。
> 没错，这个Navigator正是MaterialApp为我们提供的。但是如果home，routes，onGenerateRoute和onUnknownRoute都为null，并且builder不为null，MaterialApp则不会创建任何Navigator
### of(context)方法
> //打开一个新的页面
> Navigator.of(context).push
> //打开Scaffold的Drawer
> Scaffold.of(context).openDrawer
> //获取display1样式文字主题
> Theme.of(context).textTheme.display1
> 其实主要原理就是向上遍历 Element tree，并找到最近匹配的 state对象,(例如：Navifator.of(context)中找到NavigatorState）。也就是说of实际上是对context跨组件获取数据的一个封装
> 在 State 中 initState阶段是无法跨组件拿数据的，只有在didChangeDependencies之后才可以使用这些方法

## GlobalKey  

> 此类借鉴了react的diff算法，理解flutter运行机制需要看源码，
> abstract class GlobalKey\<T extends State<StatefulWidget>> extends Key{}
> GlobalKey是一个泛型类，但是T必须继承自State<StatefulWidget> ,因此GlobalKey专门用于组件了
> 而从GlobalKey对象上，你可以得到几个有用的属性currentElement，currentWidget，currentState。
> static final Map<GlobalKey, Element> _registry = <GlobalKey, Element>{};
> GlobalKey里含有一个Map，key和value分别为自身和Element。
> 可见GlobalKey会在组件Mount阶段把自身放到一个Map里面缓存起来。
 
### key LocalKey ValueKey 


## TabBarView

> 使用Scaffold + AppBar + Tabbar + TabbarView + TabController+（PreferredSize） 实现tabbar页面
> PreferredSize 在AppBar中，使用bottom选项构建tab时，要求使用一个preferredSizeWidget的组件类，此时可用preferredSize组件的属性设置想要的高度即可


```javascript
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
``` 

## PageView 

> 使用Scaffold + Appbar + Tabbar + PageView +PageController+ TabController 实现tabbar页面
> 若pageview的每个组件为StatefulWidget组件， 则点解tab切换页面时，子页面每次都会重新调用initState。此时子组件对应的State类可以使用with AutomaticKeepAliveClientMixin,  然后重写 @override bool get wantKeepAlive => true;
 
```javascript
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
          ///每一个 tab 对应的页面主体，是一个List<Widget>
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

``` 

## RefreshIndicator
> 通常使用此组件作下拉刷新，同时组合ListView或GridView，并用ScrollController作为监听，构建下拉刷新列表；
> 在 Flutter  中，异步 UI 更新可以通过 FutureBuilder 和 StreamBuilder 这两个组件来实现，对于网络请求，通常使用 Futrue + FutureBuilder 组合来完成。而对于下拉刷新功能；
> FutureBuilder  StreamBuilder 异步渲染ui, 此处重点结合FutureBuilder实现下拉刷新，上拉加载的组件；
```javascript
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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

/// 这里以知乎日报 API 为例说明，两个 api 如下
///最新消息
const String LAST_NEWS = "https://news-at.zhihu.com/api/4/news/latest";
///历史消息
const String HISTORY_NEWS = "https://news-at.zhihu.com/api/4/news/before/";


class MyAppState extends State<MyApp> {

  final ScrollController _scrollController = new ScrollController();

  List<dynamic> list = new List(); // list 列表数据
  Response response; // 响应
  Dio dio = new Dio();// 网络请求
  String currentDate = "";// 当前的时间
  bool isShowProgress = false; // 是否显示加载状态
  Future _getFutureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化时，加载数据，
    _getFutureData = _pullrefresh();


    // 添加活动监听器
    _scrollController.addListener((){
      ///判断当前滑动位置是不是到达底部，触发加载更多回调  上拉互动加载更多
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // if (this.onLoadMore != null && this.control.needLoadMore) {
        //   this.onLoadMore();
        // }
        _getMore(currentDate); // 监听到已经上拉的底部，在调用加载更多的方法
      }

    });
 
  }

  // 下拉刷新方法
  Future <List<dynamic>> _pullrefresh() async{
    list.clear();
    // 获取新数据
    response = await dio.get(LAST_NEWS);

    currentDate = response.data['date'].toString(); // 当前时间

    // 若请求到的数据不为空，则添加到列表list中
    if(response.data["stories"] != null){ 
      list.addAll(response.data["stories"]);
    }
    // 若列表list的长度小于6，则获取更多
    if(list.length < 6){
       _getMore(currentDate);
    }
    return list;
  }

 
  // 上拉加载更多

  _getMore(String date) async{
    if(date == ""){return;}; // 若当前时间为空，则返回空
    // 将状态修改为显示加载进度条的状态
    setState(() {
     isShowProgress = true;    
    });
    Map<String, dynamic> historyMap ;
    response = await dio.get( HISTORY_NEWS+date); // 获取当前时间之前的消息
    
    historyMap = response.data; // 获取到的数据保存到map中

    // 若historyMap中有数据，则更新当前时间
    if(historyMap != null && historyMap.length > 0){
      List<dynamic> stories = historyMap["stories"];
      if(stories != null && stories.length > 0){
        currentDate = historyMap["date"].toString();
        list.addAll(response.data["stories"]); // 有数据，则将数据添加到列表list中
      }

    }

    setState(() {
      isShowProgress = false; // 将状态修改为加载完成，取消显示加载进度
    });


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "refreshIndicator",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("refreshIndicator"),
        ),
          ///页面主体，PageView，用于承载Tab对应的页面
        body: RefreshIndicator(
          onRefresh: _pullrefresh,
          // 此处使用futureBuilder来异步渲染组件，也能够使用if elseif else 来完成，但前者的效率则大大提高
          child: FutureBuilder<List<dynamic>>(
            future: _getFutureData, // 此处使用了成员变量，避免界面每次重建时的重复加载
            builder: (context,AsyncSnapshot<List<dynamic>> async){
                // 正在请求时的视图
                if(async.connectionState == ConnectionState.active || async.connectionState == ConnectionState.waiting){
                  return Center(child: Text("加载中..."));
                }

                // 请求完成时
                if(async.connectionState == ConnectionState.done){
                  // 若果请求错误时
                  if(async.hasError){
                    return Center(child: Text("error..."));
                  }else if(async.hasData && async.data != null && async.data.length>0){

                    List result = async.data;

                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: result.length+1, // 此处长度为列表长度+1，目的就是为了显示加载进度条
                      itemExtent: 100,
                      itemBuilder: (BuildContext context,int index){
                        // 此处根据已经加载了的数据的序列 与async.date.length的长度，比较，若前者小，则说明，前一次加载的数据还未渲染完，继续渲染，
                        // 否则的话  加载更多， 若正在加载中，则显示加载进度条，不然的话就啥都不显示
                        return index < async.data.length ? Container(
                          child: new Card(
                            child: Row(
                              children: <Widget>[
                                // 此处文本描述占两列，图片占用一列
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(result[index]['title'].toString(),style:TextStyle(fontSize:16)),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: new Image.network(result[index]['images'][0].toString()),
                                    padding: EdgeInsets.all(5),
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                          ),
                          height: 50,

                        ):Center(
                          // 此组件的显示，就是上面列表长度加1的原因
                          child: isShowProgress?CircularProgressIndicator(
                            strokeWidth: 2,
                          ):Container(),
                        );

                      },

                    );

                  }else {
                    return Center(
                      child:Text("error") ,
                    );
                  }
                }else {
                  return Center(child: Text("error"));
                }

            },

          ),
        )
      ),
    );
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

}
```

### 问题
> FutureBuilder和RefreshIndicator的嵌套问题，到底谁是谁的child，。如果将RefreshIndicator放在外层，FutureBuilder作为child的话，当RefreshIndicator调用onrefreh刷新数据并用 setState（）去更新界面的时候，那FutureBuilder也会再次经历生命周期，所以导致获取数据的逻辑会被走两遍


## scrollController NotificationListener 
### scrollController
- ScrollController常用的属性和方法：
> offset：可滚动组件当前的滚动位置。
> jumpTo(double offset) 跳转到指定位置，offset 为滚动偏移量。
> animateTo(double offset,@required Duration duration,@required Curve curve) 同 jumpTo(double offset)  一样，不同的是 animateTo 跳转时会执行一个动画，需要传入执行动画需要的时间和动画曲线
- ScrollController控制原理
> ScrollController 还有其他比较重要的三个方法：
1. createScrollPosition：当 ScrollController 和可滚动组件关联时，可滚动组件首先会调 ScrollController 的 createScrollPosition 方法来创建一个ScrollPosition来存储滚动位置信息。
```javascript
ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition oldPosition);
```

2. 在滚动组件调用 createScrollPosition 方法之后，接着会调用 attach 方法来将创建号的 ScrollPosition 信息添加到 positions 属性中，这一步称为“注册位置”，只有注册后animateTo() 和 jumpTo()才可以被调用。
```javascript
void attach(ScrollPosition position);
```
3. 最后当可滚动组件被销毁时，会调用 detach()方法，将其 ScrollPosition 对象从 ScrollController 的positions 属性中移除，这一步称为“注销位置”，注销后 animateTo() 和  jumpTo()  将不能再被调用。
```javascript
void detach(ScrollPosition position);
```
### NotificationListener  
> Flutter Widget 树中子 Widge t可以通过发送通知（Notification）与父(包括祖先) Widget 进行通信，父级组件可以通过 NotificationListener 组件来监听自己关注的通知，这种通信方式类似于 Web 开发中浏览器的事件冒泡，在 Flutter 中就沿用了“冒泡”这个术语，称为通知冒泡
> Flutter 中很多地方使用了通知，如可滚动组件（Scrollable Widget）滑动时就会分发滚动通知（ScrollNotification），而 Scrollbar 正是通过监听 ScrollNotification 来确定滚动条位置的。
> 在 Flutter 中滚动监听一般可以采用两种方式来实现，分别是 ScrollController 和 NotificationListener 这两种方式
> 可以监听诸如ScrollEndNotification、ScrollStartNotification、ScrollUpdateNotification 、OverscrollIndicatorNotification等等通知； 这些都是继承自 ScrollNotification 的类，包含不同的信息；
### 两种方式的异同
> 首先这两种方式都可以实现对滚动的监听，但是他们还是有一些区别：
> ScrollController 可以控制滚动控件的滚动，而 NotificationListener 是不可以的。
> 通过 NotificationListener 可以在从可滚动组件到widget树根之间任意位置都能监听，而ScrollController只能和具体的可滚动组件关联后才可以。
> 收到滚动事件后获得的信息不同；NotificationListener在收到滚动事件时，通知中会携带当前滚动位置和ViewPort的一些信息，而ScrollController只能获取当前滚动位置
> scrollController是listview等组件通过controller属性包裹scrollController控制器构建组件，而notifacitionListener是它自己通过onNotification属性构建监听动态，通常是child属性包裹listview等组件构建
 
```javascript
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


void main(){runApp(NotificationListenerDemo());}

class NotificationListenerDemo extends StatefulWidget {
  @override
  _NotificationListenerDemo createState() => _NotificationListenerDemo();
}

class _NotificationListenerDemo extends State<NotificationListenerDemo> {
  final int DEFAULT_SCROLLER = 300;
  // 默认不显示
  double toolbarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Stack(
        children: <Widget>[
          // 此处可以给NotificationListener监听器指定泛型类，如NotificationListener<ScrollUpdateNotification>
          // 这个时候 NotificationListener 便只会接收该参数类型的通知。
          NotificationListener(
              //通知的回调处理函数，返回值为bool,当返回值为 true 时，阻止冒泡，其父级 Widget 将再也收不到该通知；当返回值为 false 时继续向上冒泡通知
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0) {
                      // 滚动位置与屏幕默认高德比例，若大于1则认为需要加载更多信息啦
                  double t = notification.metrics.pixels / DEFAULT_SCROLLER;
                  if (t < 0.0) {
                    t = 0.0;
                  } else if (t > 1.0) {
                    t = 1.0;
                  }
                  setState(() {
                    toolbarOpacity = t;
                  });

                  print(notification.metrics.pixels); //打印滚动位置
                }
                return true;
              },
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: 200,
                      // 轮播图插件
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new Image.network(
                            "http://via.placeholder.com/350x150",
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 3,
                        autoplay: true,
                        // 分页指示器，默认圆点
                        pagination: new SwiperPagination(),
                      ),
                    );
                  }
                  return ListTile(
                    title: Text("ListTile:$index"),
                  );
                },
              ),
            ),
          // 当下拉加载更多信息，一屏显示不下时，此时显示下面组件，在listview的上层显示一个标题
          Opacity(
            opacity: toolbarOpacity,
            child: Container(
              height: 98,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Text(
                    "NotificationListenerDemo",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}
```






## WillPopScope
> 是一种功能型组件，导航返回拦截WillPopScope 有点击两次过快时可能是误点需要做处理，就用到这个,如下所示
```javascript
      WillPopScope(
        // onWillPop是一个回调函数，当用户点击返回按钮时调用（包括导航返回按钮及Android物理返回按钮），该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)，最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出
        onWillPop: () async {
          // if (_lastPressedAt == null ||
          //     DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //   //两次点击间隔超过1秒则重新计时
          //   _lastPressedAt = DateTime.now();
          //   return false;
          // }
          // return true;
         
          /// 返回一个提示框
          return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: new Text('提示'),
                  content: new Text('确定退出应用吗？'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('再看一会'),
                    ),
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: new Text('退出'),
                    ),
                  ],
                ),
          ) ??
          false

        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        )
    );
```

 

## SingleChildScrollView 
> 单个子组件滚动视图,创建滚动视图,可以使得被包裹的组件能够滚动，避险软键盘弹出时遮挡输入框
> 同listview,gridview类似都是展示滚动视图的组件类，懒加载时，listview,gridview的性能会更高；

## ExpansionTile
> 折叠列表
```javascript
class ExpansionTilesDemoPage extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile Demo'),
      ),
      body: ExpansionTile(
        // 最前面的 widget
        leading: Icon(Icons.phone_android),
        // 替换默认箭头
//        trailing: Icon(Icons.phone_iphone),
        title: Text('Parent'),
        // 默认是否展开
        initiallyExpanded: true,
        // 展开时候的背景色
        backgroundColor: Colors.yellow[100],
        // 展开或者收缩的回调，true 表示展开
        onExpansionChanged: (expanded) => print('ExpansionTile is ${expanded ? 'expanded' : 'collapsed'}'),
        children: List.generate(
            10,
                (position) =>
                Container(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Text('Children ${position + 1}'),
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                )),
      ),
    );
  }
}
``` 

## animationController (SingleTickerProviderStateMixin TickerProviderStateMixin)
> 通过 with SingleTickerProviderStateMixin 实现动画效果。SingleTickerProviderStateMixin 实现 Tab 的动画切换效果 (ps 如果有需要多个嵌套动画效果，你可能需要TickerProviderStateMixin
> AnimationController用来控制一个动画的正向播放、反向播放和停止动画等操作。在默认情况下AnimationController是按照线性进行动画播放的。
> 需要注意的是在使用AnimationController的时候需要结合TickerProvider，因为只有在TickerProvider下才能配置AnimationController中的构造参数vsync。> > > TickerProvider是一个抽象类，所以我们一般使用它的实现类TickerProviderStateMixin和SingleTickerProviderStateMixin。
> 如果整个生命周期中，只有一个AnimationController，那么就使用SingleTickerProviderStateMixin，因为此种情况下，它的效率相对来说要高很多。反之，如果有多个AnimationController，就是用TickerProviderStateMixin
> 动画的建立跟AnimationController、Tween或CurveAnimation有关。
> 如果AnimationController不需要使用的时候，一定要将其释放掉，不然有可能造成内存泄露。

```javascript
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
```




## SimpleDialog AlertDialog CupertinoAlertDialog
- SimpleDialog
> 通过showDialog来创建对话框，传入BuildContext对象，通过builder构造器来创建组件简单的对话框，只要一条条的东西可以选择SimpleDialog; 
- AlertDialog
> AlertDialog组件包括标题(title)、内容(content)、actions(行为)，还有一些阴影，颜色形状等辅助属性。 
- SnackBar
> 底部弹框 使用Scaffold.of方法获取ScaffoldState调用showSnackBar;
- BottomSheet
> 底部抽屉 用法和SnackBar相似，更强的是底部栏的child你想放什么都可以
- showDatePicker
> 日历选表 返回一个DataTime泛型的Future对象
- showDatePicker
> 时间选表 返回一个TimeOfDay泛型的Future对象
- CupertinoAlertDialog
> Cupertino风格的对话框 
- CupertinoPicker
> ios风格的选择表
- CupertinoPicker
> 日历选项卡 
- CupertinoPicker 
> 时间选项卡
[参考地址](https://juejin.im/post/5d4bb7926fb9a06b084ce1d0);   

## Offstage SizedBox LimitedBox OverflowBox
> LimitedBox 限制类型的控件。LimitedBox是将child限制在其设定的最大宽高中的，但是这个限定是有条件的。当LimitedBox最大宽度不受限制时，child的宽度就会受到这个最大宽度的限制，同理高度
> Offstage 控制child是否显示，通过参数offstage控制，当offstage为true，当前控件不会被绘制在屏幕上，不会响应点击事件，也不会占用空间；当offstage为false，当前控件则跟平常用的控件一样渲染绘制；
> OverflowBox，允许child超出parent的范围显示；当OverflowBox的最大尺寸大于child的时候，child可以完整显示，当其小于child的时候，则以最大尺寸为基准，当然，这个尺寸都是可以突破父节点的。最后加上对齐方式，完成布局；
> SizedBox 设置具体尺寸，child不为null时，如果设置了宽高，则会强制把child尺寸调到此宽高；如果没有设置宽高，则会根据child尺寸进行调整；child为null时，如果设置了宽高，则自身尺寸调整到此宽高值，如果没设置，则尺寸为0；




## ConstrainedBox UnconstrainedBox  FittedBox AspectRatio
> ConstrainedBox 限制类容器,用于限制组件的最大最小值，格式如下，一个是限制条件的属性、一个是child放的内容
> UnconstrainedBox 跟ConstrainedBox相反，是不添加任何约束条件到child上，让child按照其原始的尺寸渲染
> FittedBox 会在自己的尺寸范围内缩放并且调整child位置，使得child适合其尺寸
> AspectRatio
> AspectRatio 的作用是调整child到设置的宽高比，这种控件在其他移动端平台上一般都不会提供.
```javascript
ConstrainedBox(
    constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
    child: UnconstrainedBox( //“去除”父级限制
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
        child: redBox,
      ),
    )
)
```

## expanded  Wrap 
> Wrap------>chip
> expanded---->flexible
> expanded 弹性布局
> Wrap直接使用，超过屏幕自动换行,Flow需要自己计算，但是性能较好。同时由于是自己计算的，所以换行规则可以自己定

## InheritedWidget
> 数据共享,类似一个全局变量
> didChangeDependencies这个回调函数当数值变化时会回调。如果封装一下即可实现切换语言和主题等等
 
## TextField 
> 从用户收集信息，即获取用户的输入信息；
> 通常可用onchanged和controller两种方式，其一是利用onchanged属性，TextField(onChnaged:(){})把当前的值保存到一个变量中；
> 其二就是利用TextEditingController将其值依附在组件上，TextField(controller:new TextEditingController()); 
```javascript
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
```
[参考链接](https://juejin.im/post/5c12250af265da61590b8b20)


## ShapeBorder
> 可以绘制为矩形、圆形或圆形的框边框的基类
> 基于它实现的几种常用组件类如下：
1. BeveledRectangleBorder 扁平或“斜角”角的矩形边框
2. CircleBorder 可用空间内适合圆的边界
3. StadiumBorder 半圆角矩形
4. RoundedRectangleBorder 半圆角的矩形边框






## IndexedStack
> IndexedStack继承自Stack，它的作用是显示第index个child，其他child都是不可见的。所以IndexedStack的尺寸永远是跟最大的子节点尺寸一致
```javascript
//应用页面使用有状态Widget
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

//应用页面状态实现类
class AppState extends State<App> {
  int _selectedIndex = 0; //当前选中项的索引

  final appBarTitles = ['玩Android', '体系', '公众号', '导航', "项目"];
  int elevation = 4;

  // 要显示的组件数组
  var pages = <Widget>[
    HomePage(),
    KnowledgePage(),
    PubliccPage(),
    NavigationPage(),
    ProjectPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text(appBarTitles[_selectedIndex]),
          bottom: null,
          elevation: 0,
        ),
        // 此处使用indexedStack组件显示指定序号的组件
        body: new IndexedStack(children: pages, index: _selectedIndex),
        //底部导航按钮 包含图标及文本
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), title: Text('体系')),
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('公众号')),
            BottomNavigationBarItem(
                icon: Icon(Icons.navigation), title: Text('导航')),
            BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('项目'))
          ],
          type: BottomNavigationBarType.fixed, //设置显示的模式
          currentIndex: _selectedIndex, //当前选中项的索引
          onTap: _onItemTapped, //选择按下处理
        ),
      );
  }

}
```

##  Draw UserAccountsDrawerHeader inkwell
> Draw flutter提供的抽屉视图组件
> UserAccountsDrawerHeader 在抽屉视图组件的头部，通常用来显示用户的账户信息，头像等；
> InkWell 是 Flutter 提供的一个用于实现 Material 触摸水波效果的 Widget，相当于 Android 里的 Ripple
```javascript
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // 创建一个用户的账户信息显示组件
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Tom'),
      accountEmail: new Text('tom@xxx.com'),
      // 用来显示用户的头像图片
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage('images/pic1.jpg'), radius: 35.0,),);

    return Scaffold(appBar: AppBar(title: Text("Home"),),
      body: new Center(child: new Text('Home page'),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userHeader , // Flutter有DrawerHeader，我们可以试用其进行自定义
            ListTile(title: Text('Item 1'),
              leading: new CircleAvatar(child: new Icon(Icons.school),),
              onTap: () {
                Navigator.pop(context);
              },),
            ListTile(title: Text('Item 2'),
              leading: new CircleAvatar(child: new Text('B2'),),
              onTap: () {
                Navigator.pop(context);
              },),
            ListTile(title: Text('Item 3'),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),),
              onTap: () {
                Navigator.pop(context);
              },),
          ],
        ),
      ),);
  }
}
```








## CustomPaint TabIndicationPainter
> 自定义绘制ui控件，CustomPaint就像是Android中的Paint一样，可以用它绘制出各种各样的自定义图形。确实，Paint的使用比较复杂，我觉得直接讲API的话也太无聊了，要记住Paint的用法，还是自己动手画一个比较实在
[参考链接---掘金好文](https://juejin.im/post/5bdc11be518825171140d46d)
[参考链接---掘金好文](https://juejin.im/post/5c94c4a3e51d450c1625db5a)

## Texture PlatformView
> flutter实时视频播放时用到

## CustomScrollView
> 在平时的开发中，应该会遇到这么种情况，头部是一个 GridView 接下来拼接一些别的部件，然后再拼接一个列表，因为 GridView  和 ListView 亮着都是可滑动的部件，直接拼接肯定会有「滑动冲突」，所以 Flutter 就提供了一个粘合剂，CustomScrollView
 
```javascript
class CustomScrollDemoPage extends StatelessWidget {
  // 这边用的 A-Z 字母
  final List<String> letters = [ ..... ];

  final List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.pink, Colors.yellow, Colors.deepPurple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomScrollDemo'),
      ),
      body: CustomScrollView(
        // 这里需要传入 `Sliver` 部件，下节课填坑
        slivers: <Widget>[
          // SliverGrid 实现同 GridView 实现方式一样
          // 同样 SliverGrid 有提供 `count`, `entent` 方法便于快速生成 SliverGrid
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => InkWell(
                        child: Image.asset('images/ali.jpg'),
                        onTap: () {},
                      ),
                  childCount: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0)),
          // 这里下节讲
          SliverToBoxAdapter(
              child: Container(
                  color: Colors.black12,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(children: <Widget>[
                    Divider(height: 2.0, color: Colors.black54),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset('images/app_bar_hor.jpg', fit: BoxFit.cover),
                        Text('我是一些别的东西..例如广告', textScaleFactor: 1.5, style: TextStyle(color: Colors.red))
                      ],
                    ),
                    Divider(height: 2.0, color: Colors.black54),
                  ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  alignment: Alignment.center)),
          // SliverFixedExtentList 实现同 List.custom 实现类似
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => InkWell(
                        child: Container(
                          child: Text(letters[index] * 10,
                              style: TextStyle(color: colors[index % colors.length], letterSpacing: 2.0),
                              textScaleFactor: 1.5),
                          alignment: Alignment.center,
                        ),
                        onTap: () {},
                      ),
                  childCount: letters.length),
              itemExtent: 60.0)
        ],
      ),
    );
  }
}
```

## Transform RotatedBox
> 旋转(rotate)、平移(translate)、缩(scale)
```javascript
  DecoratedBox(
    decoration:BoxDecoration(color: Colors.red),
    child: Transform.rotate(
      angle:90 ,
      child: Text("Hello world"),
    ),
  )；
  // 这种方式的旋转不会执行build方法，所以背景不会改变性能也较好一些，我的理解是它仅仅改变了child的值，而如果要改变全部则使用RotatedBox
   DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //将Transform.rotate换成RotatedBox  
      child: RotatedBox(
        quarterTurns: 1, //旋转90度(1/4圈)
        child: Text("Hello world"),
      ),
   );  
``` 