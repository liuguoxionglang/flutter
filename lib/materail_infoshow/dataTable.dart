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