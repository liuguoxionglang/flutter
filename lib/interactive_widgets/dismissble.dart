import 'package:flutter/material.dart';
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
      home:DraggableWidgetPage(),
    );
  }
}



class DraggableWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DraggableWidgetPageState();
  }
}

class _DraggableWidgetPageState extends State<DraggableWidgetPage> {

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Dismissible(
              key:ValueKey("myString"),
              child:ListTile(
                title:Text("dismissble"),
              ),
              // 向右滑动背景色
              background:Container(
                color:Colors.green,
              ),
              // 向左滑动背景色
              secondaryBackground: Container(
                color:Colors.red,
              ),
              onResize: (){
                print("onresize.............");
              },
              onDismissed: (e){
                 print("onDismissed.............$e");
              },
              

            ),
          ],
        ),
      ),
    );
  }
}