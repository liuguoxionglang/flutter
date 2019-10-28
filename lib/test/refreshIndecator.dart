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