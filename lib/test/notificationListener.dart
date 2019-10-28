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