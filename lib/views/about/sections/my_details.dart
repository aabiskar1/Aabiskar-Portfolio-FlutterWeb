import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyDetailsSection extends StatefulWidget {
  @override
  _MyDetailsSectionState createState() => _MyDetailsSectionState();
}

class _MyDetailsSectionState extends State<MyDetailsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff292929),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
            child: Column(
          children: [
            Image.asset("assets/maintainence.gif"),
            AutoSizeText("WORK IN PROGRESS....",
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MuseoModerno',
                    height: 2,
                    color: Colors.yellow,
                    fontSize: 40)),
          ],
        )),
      ),
    );
  }
}
