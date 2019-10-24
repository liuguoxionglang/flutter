# flutter widget组件之-----------可滚动的组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## GridView
> 一个可滚动的二维空间数组
- 构造函数
```javascript
GridView({
    Key key,
    Axis scrollDirection = Axis.vertical,// 滚动方向，水平和垂直
    bool reverse = false,// 子项排列是否倒序
    ScrollController controller,
    bool primary,//如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动
    ScrollPhysics physics,//滑动类型设置
    bool shrinkWrap = false,// 内容适配
    EdgeInsetsGeometry padding, // 内边距

    //gridDelegate 委托类 ,类型是SliverGridDelegate 两个常用的实现类为SliverGridDelegateWithFixedCrossAxisCount（固定列数），SliverGridDelegateWithMaxCrossAxisExtent（用于子元素有最大宽度限制的场景）
    @required this.gridDelegate,

    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    List<Widget> children = const <Widget>[],
    int semanticChildCount,
})
GridView.builder({
    //省略其它
    @required this.gridDelegate,//网格委托
    @required IndexedWidgetBuilder itemBuilder,//子项构建者
 
})
GridView.custom({
     //省略其它
    @required this.gridDelegate, //网格委托
    @required this.childrenDelegate,// 子项委托

})
GridView.count({
     //省略其它
    @required int crossAxisCount,// 列数
  
})
GridView.extent({
     //省略其它
    @required double maxCrossAxisExtent, //子项组件大小

}) 

``` 
- 应用示例
```javascript
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


```
## NestedScrollView
> 一个可以嵌套其它可滚动widget的widget
- 构造函数
```javascript
NestedScrollView({
    Key key,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    @required this.headerSliverBuilder,
    @required this.body,
  })

``` 
- 应用示例
```javascript

```
## SingleChildScrollView
> 有一个子widget的可滚动的widget，子内容超过父容器时可以滚动
- 构造函数
```javascript
SingleChildScrollView({
    Key key,
    this.scrollDirection = Axis.vertical, //滚动方向，有水平和垂直连个方向
    this.reverse = false,// 子项是否倒序排列
    this.padding,// 内边距
    bool primary,//控制是否有滑动效果，内容不足的时候，有效果
    this.physics,// 滑动类型
    this.controller,// 控制滑动位置的控制器
    this.child,// 子项
  })
``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("singleChildScrollView"),),
      body:SingleChildScrollView( 
          scrollDirection:Axis.vertical,
          reverse: true,// 子项倒序排列
          padding: EdgeInsets.all(10),
          primary: true,// 设置为true,即使内容少，也有滚动效果
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 500,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  // A fixed-height child.
                  color: const Color(0xff808000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: const Color(0xff008000), // Green
                  height: 120.0,
                ),
              ],
            ),
          ),
        
        ),
    
    );
  } 
}

```
## Scrollable
> 实现了可滚动widget的交互模型，但不包含UI显示相关的逻辑
- 构造函数
```javascript
Scrollable({
    Key key,
    this.axisDirection = AxisDirection.down,//滚动方向
    this.controller,// 控制滚动位置的控制器
    this.physics,// 股东类型
    @required this.viewportBuilder,// 创建显示滚动内容窗口的Builder
    this.excludeFromSemantics = false,
    this.semanticChildCount,// 带有语义信息的子项widget的数量
  })

``` 
- 应用示例
```javascript

```
## ScrollBar
> 一个Material Design 滚动条，表示当前滚动到了什么位置
- 构造函数
```javascript
 Scrollbar({
    Key key,
    @required this.child, // 子项 滚动条，不知道怎么用呀
  })

``` 
- 应用示例
```javascript

```
## CustomScrollView
> 一个使用slivers创建自定义的滚动效果的ScrollView
- 构造函数
```javascript
CustomScrollView({
    Key key,
    Axis scrollDirection = Axis.vertical,// // 滚动方向，水平和垂直
    bool reverse = false,// 子项是否倒序排列
    ScrollController controller,// 滚动位置控制器
    bool primary,// 是否有滚动效果
    ScrollPhysics physics,// 滚动类型
    bool shrinkWrap = false,
    double cacheExtent,
    this.slivers = const <Widget>[],// 视图窗口中的sliver组件块
    int semanticChildCount,
  })

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("scrollable"),),
      body:CustomScrollView(
        // sliver组件块
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  } 
}

```
## NotificationListener
> 一个用来监听树上冒泡通知的widget
- 构造函数
```javascript
 NotificationListener({
    Key key,
    @required this.child,// 子项
    this.onNotification,// 
  })

``` 
- 应用示例
```javascript

```
## ScrollConfiguration
> 控制可滚动组件在子树中的表现行为
- 构造函数
```javascript
ScrollConfiguration({
    Key key,
    @required this.behavior,// 子项组件scrollable的相关配置
    @required Widget child,// 子项组件
  }) 

``` 
- 应用示例
```javascript

```
## refreshIndicator
> Material Design下拉刷新指示器，包装一个可滚动widget
- 构造函数
```javascript
 RefreshIndicator({
    Key key,
    @required this.child,
    this.displacement = 40.0,
    @required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
  })

``` 
- 应用示例
```javascript
class MyStatePageState extends State<MyStatePage>{
  // TODO: implement build
  var curPage = 1;
  ScrollController _controller = new ScrollController();
  var listData = List<String>.generate(30, (i) => "CL $i");

  Future<Null> _pullToRefresh() async {
    print("object.........................................");
//    curPage = 1;
  //下拉刷新做处理
    setState(() {
      ////改变数据，这里随意发挥
      listData = List<String>.generate(30, (i) => "CL $i");
    });
    return null;
  }

  MyStatePageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;

      if (maxScroll == pixels && listData.length < 100){
//        上拉刷新做处理
        print('load more ...');
//        curPage++;
        setState(() {
          //改变数据，这里随意发挥
          listData = List<String>.generate(100, (i) => "CL $i");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // 创建listview 列表
    Widget listView = new ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context,i) {
        //这里填充自己想要的列表UI
        return new Container(
          height: 45.0,
          color: Colors.blue,
          child: new Text(
            "bbbbbbbbbbbbbbbbbbbbbbb___$i",
            style: new TextStyle(fontSize: 15.0),
          ),
        );
      },
      controller: _controller,
    );
    
    return new RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
  }

}

```
