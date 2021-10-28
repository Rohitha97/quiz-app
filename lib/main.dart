import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qa/menuScreen.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "gabriola"),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16235B),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Center(
                child: Image(
                  image: AssetImage("assets/QAWelcome.png"),
                  width: 450,
                  height: 450,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 60,
                ),
                child: RaisedButton(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(0.0),
                  textColor: Color(0xFFFFF3C2),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(),
                      ),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFFF0000), Color(0xFFFFECBA)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 250, minHeight: 55),
                      alignment: Alignment.center,
                      child: Text(
                        "Let's Start",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
