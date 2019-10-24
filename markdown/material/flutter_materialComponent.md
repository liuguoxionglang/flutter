# flutter material widget组件之-----------结构与导航相关组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## MaterialApp
> 容器组件，使我们定义子组件的容器，一个方便的widget，它封装了应用程序实现Material Design所需要的一些widget
- 属性介绍
```javascript
    MaterialApp(
      title: 'TabBar', //用于为用户识别应用程序的单行描述
      theme: ThemeData(
        //应用各种 UI 所使用的主题颜色
        primarySwatch: Colors.red,
      ),
      color: Colors.red, //操作系统界面中用于应用程序的主要颜色,在Android上，这是应用程序切换器中应用程序使用的颜色。
      home: MaterialAppDemo(), //MaterialApp 显示的主界面
      routes: <String, WidgetBuilder>{
        // 应用的顶级导航表格，这个是多页面应用用来控制页面跳转的，类似于网页的网址
        "/MaterialApp": (BuildContext context) => TabBarView(),
      },
      initialRoute: '', //第一个显示的路由名字，默认值为 Window.defaultRouteName
      navigatorObservers: List<NavigatorObserver>(), //导航观察器
      debugShowMaterialGrid: false, //是否显示 纸墨设计 基础布局网格，用来调试 
    )
```
- 应用示例
```javascript
    import 'package:flutter/material.dart';
    // 入口函数
    void main()=> runApp(myApp());

    class myApp extends StatelessWidget {

    Widget build(BuildContext context){

        return new MaterialApp(
            title: 'material title',
            //设置应用各控件的主题颜色
            theme: ThemeData(
                primaryColor: Colors.red,
                ),
            color: Colors.green,
            // 主页面
            home: Scaffold(
                //1.设置应用栏，显示在脚手架顶部
                appBar: AppBar(
                title: Text('material顶部按钮'),
                ),
                body: Center(child: Text("data material"),),
            ),
            // 定义页面路由的跳转规则，当使用 Navigator.pushNamed 来路由的时候，
            //会在 routes 查找路由名字，然后使用 对应的 WidgetBuilder 来构造一个带有页面切换动画的 MaterialPageRoute
            // 若是单页面时，则不需要此项，
            routes: <String,WidgetBuilder>{
                "/materialApp":(BuildContext context)=>TabBarView(),
            }, 
        );

    }

    }

``` 
## Scaffold
> Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。
- 属性介绍
```javascript
    //脚手架
    Scaffold({
        Key key,
        this.appBar,//设置应用栏，显示在脚手架顶部
        this.body,//设置脚手架内容区域控件
        this.floatingActionButton,//设置显示在上层区域的按钮，默认位置位于右下角
        this.floatingActionButtonLocation,//设置floatingActionButton的位置
        this.floatingActionButtonAnimator,//floatingActionButtonAnimator 动画 动画，但是设置了没有效果？
        this.persistentFooterButtons,//一组显示在脚手架底部的按钮(在bottomNavigationBar底部导航栏的上面)
        this.drawer,//设置左边侧边栏
        this.endDrawer,//设置右边侧边栏
        this.bottomNavigationBar,//设置脚手架 底部导航栏
        this.bottomSheet,//底部抽屉栏
        this.backgroundColor,//设置脚手架内容区域的颜色
        this.resizeToAvoidBottomPadding = true,// ? 控制界面内容 body 是否重新布局来避免底部被覆盖，比如当键盘显示的时候，重新布局避免被键盘盖住内容。
        this.primary = true,//脚手架是否显示在最低部
    })
```
- 应用示例
```javascript
    import 'package:flutter/material.dart';
    // 入口函数
    void main()=> runApp(myApp());

    class myApp extends StatelessWidget {

    Widget build(BuildContext context){

        return new MaterialApp(
            title: 'borderPractice',
            home: Scaffold(
                //1.设置应用栏，显示在脚手架顶部
                appBar: AppBar(
                title: Text('scaffold测试'),
                ),
                // 设置脚手架中间内容区域的内容
                body: Container(
                child: Text("内容"),
                ),
                // 设置显示在上层区域的按钮，默认位置右下角
                floatingActionButton:FloatingActionButton(
                tooltip: "新增",
                child: Icon(Icons.add),
                ), 
            ),
        );

    }

    }

``` 
## AppBar
> AppBar:一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成
- 属性介绍
```javascript
    AppBar({
        Key key,
        this.leading,//在标题前面显示的一个控件，在首页通常显示应用的logo,在其他界面通常显示为返回按钮
        this.automaticallyImplyLeading = true,//控制是否应该尝试暗示前导小部件为null
        this.title,//当前界面的标题文字
        this.actions,//一个 Widget 列表，代表 Toolbar中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
        this.flexibleSpace,//一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        this.bottom,//一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
        this.elevation = 4.0,//? 材料设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
        this.backgroundColor,//APP bar 的颜色，默认值 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
        this.brightness,//App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
        this.iconTheme,//App bar 上图标的主题 包括 颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
        this.textTheme,//App bar 上的文字样式。默认值为 ThemeData().primaryTextTheme
        this.primary = true,//此应用栏是否显示在屏幕顶部
        this.centerTitle,//标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
        this.titleSpacing = NavigationToolbar.kMiddleSpacing, //横轴上标题内容 周围的间距
        this.toolbarOpacity = 1.0, //顶部的工具栏部分的透明度 <=1.0
        this.bottomOpacity = 1.0,//bottom的工具栏部分的透明度 <=1.0
    })
```
- 应用示例
```javascript
    import 'package:flutter/material.dart';

    class Choice {
        const Choice({ this.title, this.icon });
        final String title;
        final IconData icon;
    }
    // icon信息列表
    const List<Choice> choices = const <Choice>[
        const Choice(title: 'CAR', icon: Icons.directions_car),
        const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
        const Choice(title: 'BOAT', icon: Icons.directions_boat),
        const Choice(title: 'BUS', icon: Icons.directions_bus),
        const Choice(title: 'TRAIN', icon: Icons.directions_railway),
        const Choice(title: 'WALK', icon: Icons.directions_walk),
    ];

    // 详细显示每个icon图标
    class ChoiceCard extends StatelessWidget {
        const ChoiceCard({ Key key, this.choice }) : super(key: key);

        final Choice choice;

        @override
        Widget build(BuildContext context) {
            final TextStyle textStyle = Theme.of(context).textTheme.display1;
            return new Card(
            color: Colors.white,
            child: new Center(
                child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    new Icon(choice.icon, size: 128.0, color: textStyle.color),
                    new Text(choice.title, style: textStyle),
                ],
                ),
            ),
            );
        }
    }
    //
    class myApp extends StatelessWidget {
        Widget build(BuildContext context){
            return new MaterialApp(
                title: 'appBar title',
                //设置应用各控件的主题颜色
                theme: ThemeData(
                    primaryColor: Colors.red,
                ),
                home :new DefaultTabController(
                    length: choices.length,
                    // 主页面
                    child: Scaffold(
                        //1.设置应用栏，显示在脚手架顶部
                        appBar: AppBar(
                            title: Text('appBar'),
                            //标题前面的控件
                            leading: Icon(Icons.access_alarm),
                            // toolbar中所显示的菜单
                            actions: <Widget>[
                                new IconButton(
                                    icon: new Icon(Icons.assessment),
                                ),
                                new IconButton(
                                    icon: new Icon(Icons.assignment),
                                ),
                            ],
                            // // 显示在appBar控件下方
                            flexibleSpace: Container(
                                color: Colors.green,
                                width: 200,
                                child: Text("aaaaaaaaaa"),
                                height:50,
                            ),
                            // appBar的颜色，默认themedata.primaryColor
                            backgroundColor: Colors.deepOrange,
                            primary: true,
                        ),
                    ),
                ), 
            );
        }
    }
    

    
    // 入口函数
    void main()=> runApp(myApp());

``` 
## TabBar
> TabBar: 一个显示水平选项卡的Material Design widget
```javascript
    TabBar(
      tabs: widget.mTab, //设置tabbar 的标签显示内容，一般使用Tab对象,当然也可以是其他的Widget
      controller:TabController(length: 3, vsync: this), //TabController对象
      isScrollable: true, //是否可滚动
      indicatorColor: Colors.lightBlueAccent, //指示器颜色
      indicatorWeight: 10.0, //指示器的高度
      indicatorPadding: EdgeInsets.all(10), //底部指示器的Padding
      indicator: BoxDecoration(
          border: Border.all(
          width: 1, color: Colors.black)), //指示器decoration，例如边框、颜色等
      indicatorSize: TabBarIndicatorSize.tab, //指示器大小计算方式,label 为以文本为边框计算，tab 为以指示器为边框计算
      labelColor: Colors.yellowAccent, //tab 标签颜色
      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
      unselectedLabelColor: Colors.redAccent, //未选中Tab中文字颜色
      unselectedLabelStyle:TextStyle(color: Colors.red, fontSize: 25),//未选中Tab中文字style
      )
```
- 应用示例
```javascript
    // 其它代码同AppBar 修改myApp类如下：
    class myApp extends StatelessWidget {
        Widget build(BuildContext context){
            return new MaterialApp(
                title: 'appBar title',
                home :new DefaultTabController(
                    length: choices.length,
                    // 主页面
                    child: Scaffold(
                        appBar: AppBar(
                            title: Text('tabBar'),
                            backgroundColor: Colors.grey,
                            //一个appbarBottomWidget对象，通常用tabBar
                            bottom: new TabBar(
                                isScrollable: true,// 是否可水平滚动,
                                //tabBar的标签内容 通常是用tab，可以用其他
                                tabs: choices.map((Choice choice) {
                                    return new Tab(
                                    text: choice.title,
                                    icon: new Icon(choice.icon),
                                    );
                                }).toList(),
                                // 指示器颜色
                                indicatorColor: Colors.black,
                                //指示器装饰
                                indicator: BoxDecoration(
                                    border: Border.all(width: 2,color: Colors.black)
                                ),
                                // tab标签颜色
                                labelColor: Colors.lightGreen,
                            ) ,
                        ),
                    ),
                ), 
            );
        }
    }
``` 
## TabBarView
> TabBarView: 显示与当前选中的选项卡相对应的页面视图,通常和TabBar一起使用;TabBar就是导航栏，TabBarView就是导航栏当前所对应的内容区
- 属性介绍
```javascript
TabBarView(
    children: mTabView,//用于切换的子控件列表，若要合TabBar一起使用注意和TabBar的长度一样
    controller:_tabController,//控制器，若TabBar一起使用注意和TabBar使用同一个controller ，这样才能保证两者的联动关系
    physics: ScrollPhysics()), //??
    drawerDragStartBehavior: DragStartBehavior.start, //?
    );
```
- 应用示例
```javascript
// 其它代码同AppBar,修改myApp代码如下：
class myApp extends StatefulWidget {
   @override
   _appTabBarView createState() => new _appTabBarView();
}
// 使用TabController 时对应的类要实现 TickerProviderStateMixin 接口
class _appTabBarView extends State<myApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 初始化tabController，保证tabBarView子组件长度与tabBar长度一致
    _tabController = new TabController(vsync: this, length: choices.length);
     //监听tab切换的回调
    // _tabController.addListener(() {
    //   var index = _tabController.index;
    //   AlertDialog(title: new Text("dd"));
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  // 点击箭头时的回调函数
  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length)
      return;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home:new Scaffold(
        appBar: new AppBar(
          title:Text("tabBarView"),
          // 顶部标题前面按钮
          leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            onPressed: () { _nextPage(-1); },
          ),
          // widgets列表，通常显示三个点
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.arrow_forward),
              tooltip: 'Next choice',
              onPressed: () { _nextPage(1); },
            ),
          ],
          // 标题下面的一个Tab导航栏
          bottom:new PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: new Container(
                height: 48.0,
                alignment: Alignment.center,
                child: new TabPageSelector(controller: _tabController),
              ),
            ),
          ),
        ),


        body: new TabBarView(
          // 控制器
          controller: _tabController,
          // drawerDragStartBehavior: DragStartBehavior.start,没有？？？
          // 子控件列表
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}
``` 
## BottomNavigationBar
> 底部导航条，可以很容易地在tap之间切换和浏览顶级视图,底部导航栏统筹与Scaffold结合使用，它通常作为Scaffold.bottomNavigationBar参数提供
- 属性介绍
```javascript
    BottomNavigationBar（{
        Key key，
        @ required List < BottomNavigationBarItem > items，//放入导航栏的控件item列表长度items必须至少为2，每个项目的图标和标题不得为空，
        ValueChanged < int > onTap，//点击导航栏子item的时候的
        int currentIndex：0，//当前活动BottomNavigationBarItem的项目 索引。
        double elevation：8.0，//设置z 轴坐标，设置了并没有什么效果
        BottomNavigationBarType type，//底部导航栏的类型，有fixed和shifting两个类型，不同类型显示效果不一样
        Color fixedColor，//选中的时候的字体颜色，不能跟selectedItemColor 一起用
        Color backgroundColor，//导航栏背景颜色 ，设置不了??
        double iconSize：24.0，// icon的大小 ,设置了并木有效果
        Color selectedItemColor，//选中的时候的字体颜色，不能跟fixedColor 一起用
        Color unselectedItemColor，//未选中BottomNavigationBarItem标签 的字体大小
        IconThemeData selectedIconTheme： const IconThemeData（），//选中时的子Item的样式，这个不能跟BottomNavigationBarItem Icon 的colors 一起用，否则会以Icon 的colors为准，主题设置的不会生效，并且icon必须为官方的icon为主，否则也无法生效
        IconThemeData unselectedIconTheme： const IconThemeData（），              //未选中时的BottomNavigationBarItem.icon s中图标的大小，不透明度和颜色
        double selectedFontSize： 14.0，//选中的tab的字体的大小
        double unselectedFontSize： 12.0，//未选中BottomNavigationBarItem标签 的字体大小
        TextStyle selectedLabelStyle，//选中的时候的字体样式，设置了并没有生效
        TextStyle unselectedLabelStyle，//未选中时的字体样式，设置了并没有生效
        bool showSelectedLabels，//是否为未选择的BottomNavigationBarItem显示标签
        bool showUnselectedLabels,//是否为选定的BottomNavigationBarItem显示标签
    }）

    BottomNavigationBarItem({
        @required Widget icon,//设置icon图标
        Widget title,//设置标签控件
        Widget activeIcon,//选中的时候的标签控件
        Color backgroundColor,//BottomNavigationBarType为shifting时的背景颜色
    })

```
- 应用示例
```javascript
    class myApp extends StatefulWidget {
        @override
        _appTabBarView createState() => new _appTabBarView();
        
    }

    class _appTabBarView extends State<myApp>  {
        int _selectedIndex =0; //默认选中底部导航栏第一个子项

        // 点击底部导航栏底部子项的回调
        void _onItemTapped(int index) {
            setState(() {
            _selectedIndex = index;
            });
        }
        // 定义主页面数组
        var _pageList =[
            Center(child: Text("第一页")),
            Center(child: Text("第二页")),
            Center(child: Text("第三页")),
        ];
        
        @override
        Widget build(BuildContext context) {
            // TODO: implement build
            return new MaterialApp(
            home:new Scaffold(
                appBar: new AppBar(
                    title:Text("bottomNavigationBar"),
                ),
                // 底部导航栏
                bottomNavigationBar: BottomNavigationBar(
                    // 底部导航的子控件列表
                    items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.accessibility_new), //底部导航栏子项图标
                            title: Text("首页"),//底部导航栏子项标题
                            activeIcon: Icon(Icons.add), // 被选中后的图标
                            backgroundColor: Colors.red // bottomNavigationBarType为shifting时有效
                        ),
                        BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("主体")),
                        BottomNavigationBarItem(icon: Icon(Icons.mail),title: Text("我的")),
                    ],
                    // 当前显示的子项目
                    currentIndex: _selectedIndex,
                    // 导航栏的显示类型
                    type: BottomNavigationBarType.fixed,
                    // 选中时候的颜色
                    fixedColor: Colors.orange,
                    // icon图标大小
                    iconSize: 28,
                    // 点击子项时的回调函数
                    onTap:_onItemTapped ,
                ),
                body: _pageList[_selectedIndex],
                
            ),
            );
        }
    }

    // 入口函数
    void main()=> runApp(myApp());
``` 
## Drawer
> 从Scaffold边缘水平滑动以显示应用程序中导航链接的Material Design面板。Drawer就是抽屉，可以实现拉出推入的效果，和Android中的DrawerLayout类似。Drawer通常与Scaffold.drawer属性一起使用，抽屉的子项通常是ListView，其第一个子项是头部，头部主要有两个Widget可以实现：DrawerHeader:展示基本的信息;UserAccountsDrawerHeader:展示用户头像、用户名、Email等信息。
- 属性介绍
```javascript
    Drawer({
        Key key, 
        double elevation: 16.0, //设置z坐标轴
        Widget child, // 抽屉组件中的子项
        String semanticLabel //抽屉打开关闭时的提示语
    })
    UserAccountsDrawerHeader({
        Key key,
        this.decoration, // 装饰器
        this.margin = const EdgeInsets.only(bottom: 8.0),//外边距
        this.currentAccountPicture,// 当前用户头像
        this.otherAccountsPictures,// 其它用户头像
        @required this.accountName,//用户名
        @required this.accountEmail,//用户邮箱
        this.onDetailsPressed
    })
    DrawerHeader({
        Key key,
        this.decoration,// 装饰器对象
        this.margin = const EdgeInsets.only(bottom: 8.0),//外边距
        this.padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),//内边距
        this.duration = const Duration(milliseconds: 250),//滑动时间
        this.curve = Curves.fastOutSlowIn,// 滑动效果
        @required this.child,//子组件
    }) 
```
- 应用示例
```javascript
    class myApp extends StatefulWidget {
        @override
        _appTabBarView createState() => new _appTabBarView();
        
    }

    class _appTabBarView extends State<myApp>  {

        @override
        Widget build(BuildContext context) {
            // TODO: implement build
            return new MaterialApp(
                home:new Scaffold(
                    appBar: new AppBar(
                        title:Text("drawer"),
                    ),
                    drawer:Drawer(
                    child: DrawerHeader(
                        // 装饰器 此处只设置了颜色
                        decoration: BoxDecoration(color: Colors.blueGrey),
                        //滑动时间  好像没起作用？？
                        duration: Duration(seconds: 5,minutes: 1),
                        // 滑动效果  
                        curve: Curves.easeOut,
                        //组件子项
                        child: Center(child: Text("data"),),
                    ),
                    // // 抽屉内容组件
                    // child:  ListView(
                    //   padding: EdgeInsets.zero,
                    //   children: <Widget>[
                    //     UserAccountsDrawerHeader(
                    //       // 用户名
                    //       accountName: Text('liuguoxioanglang'),
                    //       //用户邮箱
                    //       accountEmail: Text('liuguo4444@163.com'),
                    //       // 当前用户头像
                    //       currentAccountPicture: CircleAvatar(
                    //         child: Icon(Icons.picture_in_picture),
                    //       ),
                    //       // 其他用户头像
                    //       otherAccountsPictures: <Widget>[
                    //         CircleAvatar(child: Icon(Icons.ac_unit),),
                    //         CircleAvatar(child: Icon(Icons.hot_tub),),
                    //       ],
                    //       // 外边距
                    //       margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //       // 装饰器
                    //       decoration: BoxDecoration(color: Colors.grey),
                    //     ),
                    //     // 用ListTile设置列表项
                    //     ListTile(
                    //       leading: Icon(Icons.local_post_office),
                    //       title: Text('邮件'),
                    //     ),
                    //     ListTile(
                    //       leading: Icon(Icons.settings),
                    //       title: Text('设置'),
                    //     )
                    //   ],
                    // ),
                    
                    semanticLabel: "开始sssssss", // 没卵用啊？？
                    )
                ),
            );
        }
    }

    // 入口函数
    void main()=> runApp(myApp());


``` 
## WidgetsApp
> 一个方便的类，它封装了应用程序通常需要的一些widget
- 属性介绍
```javascript
    WidgetsApp({
        Key key, 
        GlobalKey<NavigatorState> navigatorKey, //导航键
        RouteFactory onGenerateRoute, // 生成路由
        RouteFactory onUnknownRoute, //未知路由
        List<NavigatorObserver> navigatorObservers: const [], // 导航观察期 
        String initialRoute,//初始路由
        PageRouteFactory<T> pageRouteBuilder, //路由工厂
        Widget home, //主页
        Map<String, WidgetBuilder> routes: const {},//路由
        TransitionBuilder builder,  // 建造者
        String title: '',//标题
        GenerateAppTitle onGenerateTitle,// 生成标题
        TextStyle textStyle, //文本样式
        @required Color color, //颜色
        Locale locale, //地点
        Iterable<LocalizationsDelegate> localizationsDelegates, //本地化委托
        
        LocaleListResolutionCallback localeListResolutionCallback, 
        
        LocaleResolutionCallback localeResolutionCallback, //区域分辨回调
        Iterable<Locale> supportedLocales: const [Locale('en', 'US')], //支持区域
        bool showPerformanceOverlay: false, //显示性能叠加
        bool checkerboardRasterCacheImages: false, //棋盘格光栅缓存图像
        bool checkerboardOffscreenLayers: false, //棋盘格层
        bool showSemanticsDebugger: false, //显示语义调试器
        bool debugShowWidgetInspector: false, // 调试小部件检测
        bool debugShowCheckedModeBanner: true, //调试显示检查模式横幅
        InspectorSelectButtonBuilder inspectorSelectButtonBuilder //审查员选择按钮生成器
    })
```
- 应用示例
```javascript
``` 
  