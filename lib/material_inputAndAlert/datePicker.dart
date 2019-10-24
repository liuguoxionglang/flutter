import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   var _time="aa";
   var _date ="aa";

  _showDataPicker () async  {
    // Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2019),
      // locale: myLocale
    );
    setState(() {
      _date = picker.toString();
    });
   
  }

  _showTimePicker() async {
    var picker =
        await showTimePicker(
          context: context, //上下文
          initialTime: TimeOfDay.now()// 初始化时间
        );
    setState(() {
      _time = picker.toString();
    });
  }

 


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
         child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("选择日期"),
                onPressed: ()=>_showDataPicker()
              ),
              Text(_date),
              RaisedButton(
                child: Text("选择时间"),
                onPressed: ()=>_showTimePicker()
              ),
              Text(_time),
           ],
         )
        
      )
    
    );
  }
}
