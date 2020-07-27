import 'package:aabiskar/services/mail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:lottie/lottie.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff292929),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/phone_message.gif',
                width: 300,
                height: 300,
              ),
            ),
            Text(
              'Contact Me',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MuseoModerno',
                  height: 2,
                  color: Colors.white,
                  fontSize: 40),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.indigoAccent,
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    enabledBorder: OutlineInputBorder(
                      // when field is in focus
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // when field is in focus
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: new BorderSide(color: Colors.indigoAccent),
                    ),
                    labelText: "Full Name",
                    labelStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.indigoAccent,
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    enabledBorder: OutlineInputBorder(
                      // when field is in focus
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // when field is in focus
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: new BorderSide(color: Colors.indigoAccent),
                    ),
                    labelText: "Your Email",
                    labelStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.subject,
                      color: Colors.indigoAccent,
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    enabledBorder: OutlineInputBorder(
                      // when field is in focus
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // when field is in focus
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: new BorderSide(color: Colors.indigoAccent),
                    ),
                    labelText: "Subject",
                    labelStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: TextField(
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.message,
                        color: Colors.indigoAccent,
                      ),
                      contentPadding: const EdgeInsets.all(8.0),
                      enabledBorder: OutlineInputBorder(
                        // when field is in focus
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // when field is in focus
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: new BorderSide(color: Colors.indigoAccent),
                      ),
                      labelText: "Message",
                      labelStyle: TextStyle(color: Colors.white60),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.indigoAccent,
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final Email email = Email(
                    body: 'Email body',
                    subject: 'Email subject',
                    recipients: ['contact@aabiskar.com'],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
