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
      initialRoute: '/',
       home: MyHomePage(),
      routes: {
        '/lgx': (BuildContext context) => HomePage(),
        '/signup': (BuildContext context) => SignUpPage(),
      },
    );
  }
}
// 主页面
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.red,
            onPressed: (){
                Navigator.pushNamed(context, "/lgx");
            },
            child: Text("lgx"),
          ),
           RaisedButton(
            color: Colors.green,
            onPressed: (){
                Navigator.pushNamed(context, "/signup");
            },
            child: Text("signup"),
          ),

        ],
      ),
    );
  }
}

// 路由lgx指向的页面
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lgx"),
        leading:IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () {Navigator.pop(context);},
         ),
      ),
      body:  DefaultTextStyle(
        style: Theme.of(context).textTheme.display1,
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Text('lgx'),
        ),
      ),
    );
  }
}

class CollectPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1,
      child: GestureDetector(
        onTap: () {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          Navigator.of(context)
              .pushReplacementNamed('signup/choose_credentials');
        },
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Text('Collect Personal Info Page'),
        ),
      ),
    );
  }
}

class ChooseCredentialsPage extends StatelessWidget {
  const ChooseCredentialsPage({
    this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignupComplete,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.display1,
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text('Choose Credentials Page'),
        ),
      ),
    );
  }
}

// 路由signup指向的页面
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SignUpPage builds its own Navigator which ends up being a nested
    // Navigator in our app.
    return Scaffold(
      appBar: AppBar(
        title: Text("sinup"),
        leading:IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () {Navigator.pop(context);},
         ),
      ),
      body: Navigator(
        initialRoute: 'signup/personal_info',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'signup/personal_info':
              // Assume CollectPersonalInfoPage collects personal info and then
              // navigates to 'signup/choose_credentials'.
              builder = (BuildContext _) => CollectPersonalInfoPage();
              break;
            case 'signup/choose_credentials':
              // Assume ChooseCredentialsPage collects new credentials and then
              // invokes 'onSignupComplete()'.
              builder = (BuildContext _) => ChooseCredentialsPage(
                    onSignupComplete: () {
                      // Referencing Navigator.of(context) from here refers to the
                      // top level Navigator because SignUpPage is above the
                      // nested Navigator that it created. Therefore, this pop()
                      // will pop the entire "sign up" journey and return to the
                      // "/" route, AKA HomePage.
                      Navigator.of(context).pop();
                    },
                  );
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}