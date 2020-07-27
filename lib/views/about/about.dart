import 'package:aabiskar/views/about/sections/experience_garageinc.dart';
import 'package:aabiskar/views/about/sections/experience_sbsolutions.dart';
import 'package:aabiskar/views/about/sections/my_details.dart';
import 'package:aabiskar/views/about/sections/technologies.dart';

import 'package:flutter/material.dart';

import 'sections/contact.dart';

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  var _sections = [
    ContactSection(),
    Technologies(),
    ExperienceGarageInc(),
    ExperienceSBSolutions(),
  ];
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
              selectedIconTheme: IconThemeData(color: Colors.white),
              unselectedIconTheme: IconThemeData(color: Colors.white60),
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
                  icon: Icon(Icons.build),
                  label: Text('Technologies'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  label: Text('Garage Inc Experience'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  label: Text('SBSolutions Experience'),
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
