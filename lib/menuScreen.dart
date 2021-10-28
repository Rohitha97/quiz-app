import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qa/quizScreen/techScreen.dart';
import 'package:qa/quizScreen/gnScreen.dart';
import 'package:qa/quizScreen/mathScreen.dart';
import 'package:qa/quizScreen/scienceScreen.dart';
import 'package:qa/quizScreen/geagraphyScreen.dart';
import 'package:qa/quizScreen/sportScreen.dart';

class MenuScreen extends StatelessWidget {
  final int score;

  MenuScreen({this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'Select the Subject',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Image.asset(
              'assets/mini.png',
              fit: BoxFit.contain,
              height: 38,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF16235B),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
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
                            builder: (context) => TechScreen(),
                          ),
                        );
                      },
                      colorBrightness: Brightness.dark,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFF3F4D8B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 170, minHeight: 150),
                          alignment: Alignment.center,
                          child: Text(
                            " Technology\nQuestion -10",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
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
                            builder: (context) => GnScreen(),
                          ),
                        );
                      },
                      colorBrightness: Brightness.dark,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFF3F4D8B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 170, minHeight: 150),
                          alignment: Alignment.center,
                          child: Text(
                            "General Knowledge\n     Question -10",
                            style: TextStyle(
                              fontSize: 27,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
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
                            builder: (context) => MathScreen(),
                          ),
                        );
                      },
                      colorBrightness: Brightness.dark,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFF3F4D8B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 170, minHeight: 150),
                          alignment: Alignment.center,
                          child: Text(
                            " Mathematics\n Question -10",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
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
                            builder: (context) => ScienceScreen(),
                          ),
                        );
                      },
                      colorBrightness: Brightness.dark,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFF3F4D8B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 170, minHeight: 150),
                          alignment: Alignment.center,
                          child: Text(
                            "   Science\nQuestion -10",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
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
                            builder: (context) => GeoScreen(),
                          ),
                        );
                      },
                      colorBrightness: Brightness.dark,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFF3F4D8B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 170, minHeight: 150),
                          alignment: Alignment.center,
                          child: Text(
                            " Geagraphy\nQuestion -10",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
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
                            builder: (context) => SportScreen(),
                          ),
                        );
                      },
                      colorBrightness: Brightness.dark,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFF3F4D8B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 170, minHeight: 150),
                          alignment: Alignment.center,
                          child: Text(
                            "    Sports\nQuestion -10",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
