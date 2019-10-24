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
  List<Stories> _newsData = [];
  int date = 20190523;
  Future _future;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _future = getNewsList();
  }
  // 异步获取数据
  Future getNewsList() async {
    var response =
        await _dio.get('https://news-at.zhihu.com/api/4/news/before/$date');
        
    setState(() {
      _newsData.addAll(ZhiHuNews.fromJson(response.data)._stories);
    });
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
      body: FutureBuilder(
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
        future: _future,
      ),
    );
  }

  // 刷新
  // Future refresh() async {
  //   setState(() {
  //     _future = getNewsList();
  //   });
  // }
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

class ZhiHuNews {
  String _date;
  List<Stories> _stories;
  List<TopStories> _topStories;

  ZhiHuNews({String date, List<Stories> stories, List<TopStories> topStories}) {
    this._date = date;
    this._stories = stories;
    this._topStories = topStories;
  }

  String get date => _date;

  set date(String date) => _date = date;

  List<Stories> get stories => _stories;

  set stories(List<Stories> stories) => _stories = stories;

  List<TopStories> get topStories => _topStories;

  set topStories(List<TopStories> topStories) => _topStories = topStories;

  ZhiHuNews.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    if (json['stories'] != null) {
      _stories = new List<Stories>();
      json['stories'].forEach((v) {
        _stories.add(new Stories.fromJson(v));
      });
    }
    if (json['top_stories'] != null) {
      _topStories = new List<TopStories>();
      json['top_stories'].forEach((v) {
        _topStories.add(new TopStories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    if (this._stories != null) {
      data['stories'] = this._stories.map((v) => v.toJson()).toList();
    }
    if (this._topStories != null) {
      data['top_stories'] = this._topStories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stories {
  List<String> _images;
  int _type;
  int _id;
  String _gaPrefix;
  String _title;

  Stories(
      {List<String> images, int type, int id, String gaPrefix, String title}) {
    this._images = images;
    this._type = type;
    this._id = id;
    this._gaPrefix = gaPrefix;
    this._title = title;
  }

  List<String> get images => _images;

  set images(List<String> images) => _images = images;

  int get type => _type;

  set type(int type) => _type = type;

  int get id => _id;

  set id(int id) => _id = id;

  String get gaPrefix => _gaPrefix;

  set gaPrefix(String gaPrefix) => _gaPrefix = gaPrefix;

  String get title => _title;

  set title(String title) => _title = title;

  Stories.fromJson(Map<String, dynamic> json) {
    _images = json['images'].cast<String>();
    _type = json['type'];
    _id = json['id'];
    _gaPrefix = json['ga_prefix'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this._images;
    data['type'] = this._type;
    data['id'] = this._id;
    data['ga_prefix'] = this._gaPrefix;
    data['title'] = this._title;
    return data;
  }
}

class TopStories {
  String _image;
  int _type;
  int _id;
  String _gaPrefix;
  String _title;

  TopStories({String image, int type, int id, String gaPrefix, String title}) {
    this._image = image;
    this._type = type;
    this._id = id;
    this._gaPrefix = gaPrefix;
    this._title = title;
  }

  String get image => _image;

  set image(String image) => _image = image;

  int get type => _type;

  set type(int type) => _type = type;

  int get id => _id;

  set id(int id) => _id = id;

  String get gaPrefix => _gaPrefix;

  set gaPrefix(String gaPrefix) => _gaPrefix = gaPrefix;

  String get title => _title;

  set title(String title) => _title = title;

  TopStories.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _type = json['type'];
    _id = json['id'];
    _gaPrefix = json['ga_prefix'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['type'] = this._type;
    data['id'] = this._id;
    data['ga_prefix'] = this._gaPrefix;
    data['title'] = this._title;
    return data;
  }
}