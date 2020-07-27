import 'package:aabiskar/delayed_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ExperienceGarageInc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff292929),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Column(
              children: [
                Text(
                  'Experience',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MuseoModerno',
                      height: 2,
                      color: Colors.white,
                      fontSize: 40),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: DelayedAnimation(
                              child: Container(
                                child: Center(
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      minRadius: 200,
                                      child:
                                          Image.asset("images/garageinc.png")),
                                ),
                              ),
                              delay: 300,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DelayedAnimation(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView(
                                    primary: false,
                                    shrinkWrap: true,
                                    children: [
                                      Text(
                                        'Garage Inc.',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white,
                                            fontSize: 26),
                                      ),
                                      Text(
                                        'Co-founder/ Developer',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                      SizedBox(height: 20),
                                      AutoSizeText(
                                        ' - Creating Java android app, Flutter apps for Android and IOS'
                                        '\n - Creating and maintaining Website and Apps'
                                        '\n - Creating APIs'
                                        '\n - Maintain all the technology related task and take decisions to implement the different technologies in the business',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              delay: 900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
    ;
  }
}
