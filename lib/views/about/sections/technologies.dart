import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Technologies extends StatefulWidget {
  static final List<String> imgList = [
    'images/Java.png',
    'images/android.png',
    'images/flutter.png',
    'images/firebase.png',
    'images/c#.png',
    'images/asp.net.png',
    'images/python.png',
    'images/php.png',
    'images/angular.png',
    'images/mysql.png',
    'images/oracle sql.png',
    'images/mssql.png',
  ];

  @override
  _TechnologiesState createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Color(0xff292929),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AutoSizeText(
              "Technologies I've worked with",
              maxLines: 3,
              maxFontSize: 40,
              minFontSize: 30,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MuseoModerno',
                height: 2,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                width: double.infinity,
                child: CarouselSlider(
                  items: bannerSlider,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.5,
                      aspectRatio: 4 / 3,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> bannerSlider = Technologies.imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity - 30,
                    ),
                  )),
            ),
          ))
      .toList();
}
