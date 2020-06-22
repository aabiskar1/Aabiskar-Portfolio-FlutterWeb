import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'delayed_animation.dart';
import 'dart:js' as js;

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    final int delayedAmount = 1100;
    double _scale;
    AnimationController _controller;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Color(0xff292929)),
            child: DelayedAnimation(
              child: Card(
                color: Color(0xff292929),
                elevation: 0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 8.0),
                            child: Container(
                              child: DelayedAnimation(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage:
                                          AssetImage("images/aabiskar.jpg"),
                                    ),
                                  ],
                                ),
                                delay: delayedAmount,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              alignment: Alignment.center,
                              child: DelayedAnimation(
                                child: Text(
                                  'Aabiskar Aryal',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MuseoModerno',
                                      height: 2,
                                      color: Colors.white,
                                      fontSize: 40),
                                ),
                                delay: delayedAmount + 100,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DelayedAnimation(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Software Developer',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18,
                                  fontFamily: "MuseoModerno",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            delay: delayedAmount + 200,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              DelayedAnimation(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Card(
                                      child: Material(
                                        color: Colors.grey[300],
                                        child: InkWell(
                                          onTap: () {
                                            print("hi");
                                          },
                                          splashColor: Colors.lightBlue[200],
                                          child: Container(
                                            height: 60,
                                            width: 300,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.email,
                                                  color: Colors.indigo,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "aabiskar1@live.com",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "MuseoModerno",
                                                      color: Color(0xff4E67EB)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                delay: delayedAmount + 300,
                              ),
                              DelayedAnimation(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Card(
                                      child: Material(
                                        color: Colors.grey[300],
                                        child: InkWell(
                                          onTap: () {
                                            js.context.callMethod("open", [
                                              "https://github.com/aabiskar1"
                                            ]);
                                          },
                                          splashColor: Colors.lightBlue[200],
                                          child: Container(
                                            height: 60,
                                            width: 300,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "images/github.png",
                                                  height: 25,
                                                  width: 25,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Github.com/aabiskar1",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "MuseoModerno",
                                                      color: Color(0xff4E67EB)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                delay: delayedAmount + 500,
                              ),
                              DelayedAnimation(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Card(
                                      elevation: 20,
                                      child: Material(
                                        color: Colors.grey[300],
                                        child: InkWell(
                                          onTap: () {
                                            print("hi");
                                          },
                                          splashColor: Colors.lightBlue[200],
                                          child: Container(
                                            height: 60,
                                            width: 300,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "images/twitter.png",
                                                  width: 25,
                                                  height: 25,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "@aab_iskar",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "MuseoModerno",
                                                      color: Color(0xff4E67EB)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                delay: delayedAmount + 700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    @override
    dispose() {
      animationController.dispose(); // you need this
      super.dispose();
    }
  }
}
