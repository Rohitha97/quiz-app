import 'package:flutter/material.dart';
import 'package:qa/quizScreen/techScreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({this.score});

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
                  image: AssetImage("assets/Result.png"),
                  width: 360,
                  height: 360,
                ),
              ),
              Text(
                "$score/10",
                style: TextStyle(
                  fontFamily: "A760-Roman",
                  fontSize: 60,
                  color: Color(0xFFfff3c2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 40,
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
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFF0000), Color(0xFFFFECBA)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 250, minHeight: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "RESTART",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: RaisedButton(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(0.0),
                  textColor: Color(0xFFFFF3C2),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  colorBrightness: Brightness.dark,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xFF3F4D8B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 250, minHeight: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "EXIT",
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
