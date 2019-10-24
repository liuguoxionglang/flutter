import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: ExpansionPanelListDemo(),
  ));
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}
// 创建expand状态bean对象
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1; //当前打开的面板
  List<int> mList; // 面板序号列表
  List<ExpandStateBean> expandStateList; // 面板状态列表

  // 构造函数
  _ExpansionPanelListDemoState() {
    mList = new List();
    expandStateList=new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  // 面板展开切换时的回调函数
  _setCurrentIndex(int index,isExpand) {
    setState(() {
      expandStateList.forEach((item){
        if (item.index==index) {
          item.isOpen=!isExpand;
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ExpansionPanelList"),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            //面板子项列表
            children: mList.map((index) {
              return new ExpansionPanel(
                // 标题组件的构建函数
                headerBuilder: (context, isExpanded) {
                  return new ListTile(
                    title: new Text('我是第$index个标题'),
                  );
                },
                // 扩展主体内容
                body: new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(height: 100.0,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child:Icon(Icons.security,size: 35.0,),),
                ),
                // 面板是否展开
                isExpanded: expandStateList[index].isOpen,
              );
            }).toList(),
            // 展开面板时的回调函数
            expansionCallback: (index, bol) {
              _setCurrentIndex(index,bol);
            },
            // 切换动画时间
            animationDuration: Duration(microseconds: 100),

        ),));
  }
}