# flutter material widget组件之-----------信息展示组件
> widget分为两类：[widgets library](https://api.flutter.dev/flutter/widgets/widgets-library.html)中的标准widget和[Material Components library](https://api.flutter.dev/flutter/material/material-library.html)中的专用widget;任何应用程序都可以使用widgets library中的widget，但只有Material应用程序可以使用Material Components库。其中Card，ListTitle就是Material Components库中的组件。
## Image Icon Chip Tooltip
> Image:一个显示图片的widget,
    > 通常用 获取网络图片用 Image.network(String src, {})，
    > 加载本地图片用 Image.asset(String name, {})
    > 从一个file文件获取图片 Image.file(File file, {})
    > 从unit8list获取图片 Image.memory(Uint8List bytes, {})
> Icon:a Material Design icon.
> Chip:标签，一个Material widget。 它可以将一个复杂内容实体展现在一个小块中，如联系人
> Tooltip:一个文本提示工具，帮助解释一个按钮或其他用户界面，当widget长时间按下时（当用户采取其他适当操作时）显示一个提示标签
- 构造函数
```javascript
    Image({
        Key key,
        @required this.image,//图片Image对象
        this.semanticLabel,// 语义化的标间
        this.excludeFromSemantics = false,//控制语义化标签的显示，若为true,则semantiicLabel将被忽略
        this.width, // 图片宽
        this.height,// 图片高
        this.color,// 图片颜色
        this.colorBlendMode,//颜色混合模式
        this.fit,
        this.alignment = Alignment.center,// 居中方式
        this.repeat = ImageRepeat.noRepeat,// 图片是否重复平铺
        this.centerSlice,//
        this.matchTextDirection = false,// 是否根据文本方向绘制图片
        this.gaplessPlayback = false,// 若为真，更新时还是显示原图像，否则不显示任何内容
        this.filterQuality = FilterQuality.low,//滤镜质量
    })
     Image.asset(
        String name, // 本地图片名
        {
            Key key,
            AssetBundle bundle,
            this.semanticLabel,
            this.excludeFromSemantics = false,
            double scale,
            this.width,
            this.height,
            this.color,
            this.colorBlendMode,
            this.fit,
            this.alignment = Alignment.center,
            this.repeat = ImageRepeat.noRepeat,
            this.centerSlice,
            this.matchTextDirection = false,
            this.gaplessPlayback = false,
            String package,
            this.filterQuality = FilterQuality.low,
        }
    ),
    Image.network(
        String src, // 网络图片的url路径
        {
            Key key,
            double scale = 1.0,//缩放比例
            this.semanticLabel,
            this.excludeFromSemantics = false,//控制语义化标签的显示，若为true,则semantiicLabel将被忽略
            this.width,
            this.height,
            this.color,
            this.colorBlendMode,
            this.fit,// 图片适配容器的方式，相当于css中的backgrou-iamge-size,有BoxFit.fill,contain,cover等值
            this.alignment = Alignment.center,
            this.repeat = ImageRepeat.noRepeat,
            this.centerSlice,// 中心切片 ？？
            this.matchTextDirection = false,
            this.gaplessPlayback = false,
            this.filterQuality = FilterQuality.low,
            Map<String, String> headers,
        } 
    )
    Icon(
        this.icon, // 要显示的图标
        {
            Key key,
            this.size,//图标大小
            this.color,//图标颜色
            this.semanticLabel,//语义化标签
            this.textDirection,// 文本方向
        }
    )
    Chip({
        Key key,
        this.avatar,//通常将头像，图片之类的信息放在此widget中
        @required this.label,//标签
        this.labelStyle,//标签样式
        this.labelPadding,//标签内边距
        this.deleteIcon,//当onDeleted回调函数被设置时，添加此图标
        this.onDeleted,// 回调函数，点击deleteIcon时的回调
        this.deleteIconColor,//deleteIcon的颜色
        this.deleteButtonTooltipMessage,//长按删除button的提示信息
        this.shape,//形状
        this.clipBehavior = Clip.none,//剪切方式
        this.backgroundColor,//背景色
        this.padding,//内边距
        this.materialTapTargetSize,//材质匹配目标大小
    }) 
    Tooltip({
        Key key,
        @required this.message, //长按提示框中的内容
        this.height = 32.0,// 此提示框的高
        this.padding = const EdgeInsets.symmetric(horizontal: 16.0),//提示框的内边距
        this.verticalOffset = 24.0,//提示框距离小部件的垂直偏移
        this.preferBelow = true,//提示是否默认显示在小部件下面
        this.excludeFromSemantics = false,//是否从语义树中排出提示信息
        this.child,// 长按的小部件
    }) 

    
``` 
- 应用示例
```javascript
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
          child: Column(
            children: <Widget>[
              new Image.network(
                'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
                // 缩放比例
                scale: 6.0,
              ),
              new Image.asset("assets/images/2.jpg"),
              Icon(
                Icons.ac_unit,
                color: Colors.blue,//图标颜色
                size: 30,//图标大小
                semanticLabel: "icon演示",//语义化标签,好像没卵用？？
                textDirection: TextDirection.ltr,// 文本方向
                
              ),
              Chip(
                // 通常将头像，图片之类的信息放在此widget中
                avatar:  CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('AB'),
                ),
                label: Text('chip label'),//标签
                labelStyle: TextStyle(color: Colors.red),//标签样式
                deleteIcon: Icon(Icons.add),//当onDeleted回调函数被设置时，添加此图标
                onDeleted: (){
                  print("ondeleted..............");
                },// 回调函数，点击deleteIcon时的回调
                deleteIconColor: Colors.green,//deleteIcon的颜色
                deleteButtonTooltipMessage: "aaaa",//长按删除button的提示信息
                backgroundColor: Colors.greenAccent,//背景色
              ),

              Tooltip(
                message: "提示信息",//长按提示框中的内容
                height: 50,// 此提示框的高
                padding: EdgeInsets.all(12),//提示框的内边距
                verticalOffset:60,//提示框距离小部件的垂直偏移 此处向下偏移60
                preferBelow: true,//提示是否默认显示在小部件下面
                excludeFromSemantics: true,//是否从语义树中排出提示信息
                child: Text("data"),// 长按的小部件
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

```
## DataTable
> 数据表显示原始数据集。它们通常出现在桌面企业产品中。DataTable Widget实现这个组件
- 构造函数
```javascript
    DataTable({
        Key key,
        @required this.columns,// 各列配置
        this.sortColumnIndex,//排序列的键
        this.sortAscending = true,//有排序列的话，默认升序排序
        this.onSelectAll,// 选中行是的回调
        @required this.rows,// 各行配置
    })

    DataColumn({
        @required this.label,//列标题
        this.tooltip,//长按列标题提示
        this.numeric = false,//此列是否表示数据
        this.onSort,//按此列排序时的回调函数
    })
    DataRow({
        this.key,
        this.selected = false,//行是否被选中
        this.onSelectChanged,//选中改变时的回调
        @required this.cells,// 行中每个单元的数据
    })
    DataCell(
        this.child,
        {
            this.placeholder = false,//子项是否是占位符
            this.showEditIcon = false,//是否显示编辑图标
            this.onTap,//点击编辑图片时的回调
        }
    )  
``` 
- 应用示例
```javascript
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
          child: Column(
            children: <Widget>[
              DataTable(
                columns: [
                  DataColumn(
                    label: Text("姓名"),//列标题
                    tooltip: "name",//长按列标题提示
                    numeric: false,// 是否数字
                    onSort: (inx,bool){
                      print("点击列了。。。。。"+inx.toString()+"...."+bool.toString());
                    } //按此列排序时的回调函数
                  ),
                  DataColumn(
                    label: Text("年龄"),
                    numeric: true,
                    onSort: (inx,bool){
                      print("点击列了。。。。。"+inx.toString()+"...."+bool.toString());
                    }
                  ),
                  DataColumn(
                    label: Text("职业")
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Text("张三")
                      ),
                      DataCell(
                        Text("15")
                      ),
                      DataCell(
                        Text("乡长")
                      ),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text("李四")
                      ),
                      DataCell(
                        Text("95")
                      ),
                      DataCell(
                        Text("鼓手")
                      ),
                    ]
                  ),
                  DataRow(
                    selected: true,// 行是否被选中
                    //选中改变时的回调
                    onSelectChanged: (val){
                      print("行被选中......"+val.toString());
                    },
                    cells: [
                      DataCell(
                        Text("飞飞")
                      ),
                      DataCell(
                        Text("55"),
                        placeholder: false,//子项是否是占位符
                        showEditIcon: true,//是否显示编辑图标
                        onTap: (){
                          print("此列被编辑了。。。。。。。。。。。");
                        }//点击编辑图片时的回调
                      ),
                      DataCell(
                        Text("骑手")
                      ),
                    ]
                  ),
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}

```
## Card
> 一个 Material Design 卡片。拥有一个圆角和阴影
- 构造函数
```javascript
 Card({
    Key key,
    this.color, // 颜色
    this.elevation,// z坐标轴坐标
    this.shape,//形状
    this.margin = const EdgeInsets.all(4.0),//外边距
    this.clipBehavior = Clip.none,//剪切方式
    this.child,//子组件
    this.semanticContainer = true,//此部件是否为单个语义容器
  })
    
``` 
- 应用示例
```javascript
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
          child: Column(
            children: <Widget>[
              Card(
                // 子项
                child: Container(child: Text("data"),),
                // 颜色
                color: Colors.green,
                // 外边距
                margin: EdgeInsets.all(55),
                // z轴坐标  没卵用啊
                elevation: 55,
                // 形状
                shape:  Border.all(color: Colors.red),
                // 布尔型，好像也没卵用
                semanticContainer: false,
                clipBehavior: Clip.antiAliasWithSaveLayer,

              )
            ],
          ),
        ),
      ),
    );
  }
}

```
## LinearProgressIndicator
> 一个线性进度条，另外还有一个圆形进度条CircularProgressIndicator
- 构造函数
```javascript
LinearProgressIndicator({
    Key key,
    double value, // 指示器的值
    Color backgroundColor,//背景颜色
    Animation<Color> valueColor,///animation类型的参数，用来设定进度值的颜色，默认为主题色，指定常数颜色使用
    String semanticsLabel,//语义标签
    String semanticsValue,// 语义值
  })
  CircularProgressIndicator({
    Key key,
    double value,// 指示器的值
    Color backgroundColor,//背景颜色
    Animation<Color> valueColor,//animation类型的参数，用来设定进度值的颜色，默认为主题色，指定常数颜色使用
    this.strokeWidth = 4.0,// 指示器线宽
    String semanticsLabel,
    String semanticsValue,
  })
    
``` 
- 应用示例
```javascript
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
        body: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.6,// 指示器的进度值
              backgroundColor: Colors.greenAccent,//轨道背景颜色
              semanticsLabel: "60%",
              semanticsValue: "6",
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),// 进图条动画颜色
              // valueColor: CurvedAnimation(),
            ),
            Text("圆形指示器"),
            CircularProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.black,// 背景色没有起作用？？
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)
            ),

          ],
        ),
      ),
    );
  }
}

```
