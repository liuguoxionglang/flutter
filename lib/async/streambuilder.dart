import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
// import 'package:test_flutter/customPaintView/chess_vectors_flutter.dart';

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
      home: HomePage(),
      // 路由
      routes: {
        "/future":(BuildContext context)=> new FutureBuilderPage()
      },
     
    );
  }
}
// 主页widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME PAGE"),),
      body:Center(
        child:  Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              child: Text("future"),
              onPressed: (){
                Navigator.pushNamed(context, "/future");
              },
            ),
          ],
        ),
      ),
    );
  }
}


// 路由future指向的widget
class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Dio _dio;
  List _newsData = [];
  int date = 20190523;
  Stream _stream;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
  
  }


  // 根据获取到的数据创建listview列表
  Widget generateListView() {
    return ListView.builder(
      itemCount: _newsData.length,
      itemBuilder: (context, index) {
        var indexData = _newsData[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10, left: 6),
                    child: Text(indexData.title, style: TextStyle(fontSize: 15),),
                  ),
                  flex: 1,
                ),
                Image.network(
                  indexData.images[0],
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilderPage'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);// 返回首页
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      // futureBuilder
      body: StreamBuilder(
        // 生成器
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Input a url to connect");
            case ConnectionState.active:
              // 显示正在加载
              return createLoadingWidget();
            case ConnectionState.waiting:
              print('waiting');
              return Center(child: CupertinoActivityIndicator());
            case ConnectionState.done:
              print('done');
              if (snapshot.hasError) {
                return Center(
                  child: Text('网络请求出错'),
                );
              }

              return generateListView();
          }
          return null;
        },
        // 异步计算
        stream: _stream,
      ),
    );
  }

}
// 数据加载中时要显示的组件
class createLoadingWidget extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
     
    );
  }

}
