import 'package:aabiskar/GitHubWebView.dart';
import 'package:aabiskar/about.dart';
import 'package:aabiskar/delayed_animation.dart';
import 'package:aabiskar/flip_box_bar_custom.dart';
import 'package:flip_box_bar/flip_box_bar.dart';

import 'package:flutter/material.dart';
import 'package:platform/platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aabiskar Aryal',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Aabiskar'),
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
  int _selectedIndex = 0;
  static List<Widget> tabs = <Widget>[AboutTab(), GitHubView()];

  final int delayedAmount = 1000;
  double _scale;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Test'),
              trailing: Icon(Icons.access_alarm),
            )
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(items: ),
//      appBar: AppBar(
//        backgroundColor: Colors.indigoAccent,
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),

      body: Banner(
        location: BannerLocation.topEnd,
        message: 'W.I.P',
        child: (MediaQuery.of(context).size.width < 1180.0)
            ? tabs.elementAt(_selectedIndex)
            : Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: FlipBoxBarCustom(
                              navBarWidth: 25,
                              selectedIndex: _selectedIndex,
                              items: [
                                FlipBarItem(
                                    icon: Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                    ),
                                    text: Text(
                                      "About",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MuseoModerno',
                                      ),
                                    ),
                                    frontColor: Color(0xff323232),
                                    backColor: Color(0xff4E67EB)),
                                FlipBarItem(
                                    icon: Icon(
                                      Icons.dashboard,
                                      color: Colors.white,
                                    ),
                                    text: Text(
                                      "GitHub Repo",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MuseoModerno',
                                      ),
                                    ),
                                    frontColor: Color(0xff323232),
                                    backColor: Color(0xff4E67EB)),
                              ],
                              onIndexChanged: (newIndex) {
                                setState(() {
                                  _selectedIndex = newIndex;
                                });
                              },
                            )),
                        Expanded(flex: 9, child: tabs.elementAt(_selectedIndex))
                      ],
                    ),
                  )
                ],
              ),
      ),
      backgroundColor: Color(0xff292929),

      bottomNavigationBar: (MediaQuery.of(context).size.width < 1180.0)
          ? SizedBox(
              height: 50,
              child: FlipBoxBar(
                navBarHeight: 50,
                selectedIndex: _selectedIndex,
                items: [
                  FlipBarItem(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      text: Text(
                        "About",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MuseoModerno',
                        ),
                      ),
                      frontColor: Color(0xff323232),
                      backColor: Color(0xff4E67EB)),
                  FlipBarItem(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      text: Text(
                        "GitHub Repo",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MuseoModerno',
                        ),
                      ),
                      frontColor: Color(0xff323232),
                      backColor: Color(0xff4E67EB)),
                ],
                onIndexChanged: (newIndex) {
                  setState(() {
                    _selectedIndex = newIndex;
                  });
                },
              ),
            )
          : null,
    );
  }
}
