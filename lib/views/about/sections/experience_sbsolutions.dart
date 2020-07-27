import 'package:aabiskar/delayed_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ExperienceSBSolutions extends StatelessWidget {
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DelayedAnimation(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    primary: false,
                                    shrinkWrap: true,
                                    children: [
                                      Text(
                                        'SB Solutions.',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white,
                                            fontSize: 26),
                                      ),
                                      Text(
                                        'Software Development Intern',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                      SizedBox(height: 20),
                                      AutoSizeText(
                                        ' - Worked with Java, Angular 8 , TypeScript, Microsoft SQL and more technologies to create and maintain \n '
                                        ' Loan Automation System and Document Management System for different banks and \n  financial institute of nepal including many A-Level banks of Nepal',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                      AutoSizeText(
                                        '- Worked with popular framework such as Java Spring Boot, Hibernate , Bootstrap and more ',
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                      AutoSizeText(
                                        '- Worked with Windows server',
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                      AutoSizeText(
                                        '- Communicated with Cilents ',
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontFamily: 'MuseoModerno',
                                            height: 2,
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                      AutoSizeText(
                                        '- Created and maintained GitLab CI/CD auto deployment scripts',
                                        maxLines: 3,
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
                          Expanded(
                            child: DelayedAnimation(
                              child: Container(
                                child: Center(
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      minRadius: 200,
                                      maxRadius: 200,
                                      child: Image.asset(
                                          "images/sbsolutionslogo.png")),
                                ),
                              ),
                              delay: 300,
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
  }
}
