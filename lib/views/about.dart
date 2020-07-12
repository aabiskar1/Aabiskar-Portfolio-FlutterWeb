import 'package:aabiskar/views/sections/contact.dart';
import 'package:aabiskar/views/sections/my_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;
import '../delayed_animation.dart';
import 'dart:js' as js;

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  var _sections = [ContactSection(), MyDetailsSection()];
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

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    AnimationController _controller;

    PageController pageController = PageController();

    return Scaffold(
      body: Row(
        children: <Widget>[
          // This is the main content.
          Expanded(
              child: PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: false,
            children: _sections,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          )),

          Container(
            color: Color(0xff292929),
            width: 25,
            child: NavigationRail(
              groupAlignment: 0,
              backgroundColor: Color(0xff292929),
              selectedIconTheme: IconThemeData(color: Colors.white60),
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedIndex = newIndex;
                  pageController.animateToPage(newIndex,
                      duration: Duration(milliseconds: 550),
                      curve: Curves.easeInCubic);
                });
              },
              selectedIndex: selectedIndex,
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle),
                  label: Text('Contact'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.question_answer),
                  label: Text('About Me'),
                ),
              ],
            ),
          ),
        ],
      ),
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
