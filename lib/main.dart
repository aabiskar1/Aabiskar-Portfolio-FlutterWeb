import 'package:aabiskar/global/global.dart';
import 'package:aabiskar/views/about/about.dart';
import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/material.dart';

import 'views/GitHubWebView.dart';

import 'views/contact_form.dart';

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
        primarySwatch: Colors.indigo,
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
  static List<Widget> tabs = <Widget>[AboutTab(), GitHubView(), ContactForm()];

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
        child: (MediaQuery.of(context).size.width < breakPoint)
            ? tabs.elementAt(_selectedIndex)
            : Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: FlipBoxBarPlus(
                              navBarWidth: 25,
                              isVerticalBar: true,
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
//                                FlipBarItem(
//                                    icon: Icon(
//                                      Icons.email,
//                                      color: Colors.white,
//                                    ),
//                                    text: Text(
//                                      "Contact Me",
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                        fontFamily: 'MuseoModerno',
//                                      ),
//                                    ),
//                                    frontColor: Color(0xff323232),
//                                    backColor: Color(0xff4E67EB)),
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

      bottomNavigationBar: (MediaQuery.of(context).size.width < breakPoint)
          ? SizedBox(
              height: 50,
              child: FlipBoxBarPlus(
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
//                  FlipBarItem(
//                      icon: Icon(
//                        Icons.dashboard,
//                        color: Colors.white,
//                      ),
//                      text: Text(
//                        "Contact Form",
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontFamily: 'MuseoModerno',
//                        ),
//                      ),
//                      frontColor: Color(0xff323232),
//                      backColor: Color(0xff4E67EB)),
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
