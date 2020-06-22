import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:js' as js;

import 'package:slimy_card/slimy_card.dart';

class GitHubView extends StatefulWidget {
  @override
  _GitHubViewState createState() => _GitHubViewState();
}

class _GitHubViewState extends State<GitHubView> {
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://api.github.com/users/aabiskar1/repos");
    var jsonData = json.decode((data.body));

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u["name"], u["language"], u["description"], u["url"]);
      users.add(user);
    }
    print("this is message" + users.length.toString());
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading"),
                ),
              );
            } else {
              return Container(
                child: GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (MediaQuery.of(context).size.width > 1180.0) ? 5 : 2,
                      mainAxisSpacing: 10.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: Container(
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [
                                const Color(0xFF29323c),
                                const Color(0xFF485563),
                              ],
                              begin: Alignment.centerRight,
                              end: new Alignment(-1.0, -1.0),
                            ),
                          ),
                          child: Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/github.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    snapshot.data[index].name,
                                    style: TextStyle(
                                        fontFamily: 'MuseoModerno',
                                        color: Colors.white,
                                        fontSize: 20,
                                        height: 2),
                                  ),
                                ],
                              )),
                        ),
                        back: Container(
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [
                                const Color(0xFF485563),
                                const Color(0xFF29323c),
                              ],
                              begin: Alignment.centerRight,
                              end: new Alignment(-1.0, -1.0),
                            ),
                          ),
                          child: Card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (MediaQuery.of(context).size.width < 1180.0)
                                        ? Text(
                                            (snapshot.data[index].language ==
                                                    null)
                                                ? ""
                                                : snapshot.data[index].language
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            snapshot.data[index].description
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'MuseoModerno',
                                                color: Colors.grey,
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    OutlineGradientButton(
                                      child: SizedBox(
                                        width: 120,
                                        height: 50,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 4.0, 0.0, 0.0),
                                              child: Text('Peek',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: 'MuseoModerno',
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF485563),
                                          Color(0xFF29326c)
                                        ],
                                        begin: Alignment(-1, -1),
                                        end: Alignment(2, 2),
                                      ),
                                      strokeWidth: 4,
                                      padding: EdgeInsets.zero,
                                      radius: Radius.circular(26),
                                      elevation: 24,
                                      onTap: () {
                                        js.context.callMethod("open", [
                                          "https://www.github.com/aabiskar1/" +
                                              snapshot.data[index].name
                                        ]);
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    );
                    ;
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String language;
  final String description;
  final String url;

  User(this.name, this.language, this.description, this.url);
}
//InAppWebView()

Widget topCardWidget(String name, String language) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        '$name',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      SizedBox(height: 15),
      (language == null)
          ? Text("")
          : Text(
              '$language',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
    ],
  );
}

Widget bottomCardWidget(String language) {
  return Text(
    'It doesn\'t matter \nwhat your name is.',
    style: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.center,
  );
}
