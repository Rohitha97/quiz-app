import 'dart:async';
import 'dart:convert';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:qa/QuizHelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qa/ResultScreen.dart';

class GnScreen extends StatefulWidget {
  @override
  _GnScreenState createState() => _GnScreenState();
}

class _GnScreenState extends State<GnScreen> {
  int currentQustion = 0;
  int totalSeconds = 20;
  int elapsedSeconds = 0;

  List<Results> results;

  Timer timer;
  int score = 0;

  QuizHelper quizHelper;

  get child => null;

  @override
  void initState() {
    fetchAllQuiz();
    super.initState();
  }

  fetchAllQuiz() async {
    var response = await http.get(Uri.parse(
        "https://opentdb.com/api.php?amount=10&category=9&type=multiple"));
    var body = response.body;

    var json = jsonDecode(body);

    print(body);

    setState(() {
      quizHelper = QuizHelper.fromJson(json);
      quizHelper.results[currentQustion].incorrectAnswers
          .add(quizHelper.results[currentQustion].correctAnswer);

      quizHelper.results[currentQustion].incorrectAnswers.shuffle();

      initTimer();
    });
  }

  initTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == totalSeconds) {
        print("Time completed");
        t.cancel();
        changeQuestion();
      } else {
        setState(() {
          elapsedSeconds = t.tick;
        });
      }
    });
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  checkAnswer(answer) {
    String correctAnswer = quizHelper.results[currentQustion].correctAnswer;

    if (correctAnswer == answer) {
      score += 1;
    } else {
      print("Wrong");
    }
    changeQuestion();
  }

  changeQuestion() {
    timer.cancel();
    if (currentQustion == quizHelper.results.length - 1) {
      print("Quize Completed");
      print("Score: $score");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
          ),
        ),
      );
    } else {
      setState(() {
        currentQustion += 1;
      });
      quizHelper.results[currentQustion].incorrectAnswers
          .add(quizHelper.results[currentQustion].correctAnswer);

      quizHelper.results[currentQustion].incorrectAnswers.shuffle();
      initTimer();
    }
  }

  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (quizHelper != null) {
      return Scaffold(
        backgroundColor: Color(0xFF16235B),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/mini.png',
                fit: BoxFit.contain,
                height: 50,
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: changeQuestion,
              child: Text(
                "Skip",
                style: TextStyle(
                  fontFamily: "A760-Roman",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(
                          child: Text(
                            "$currentQustion/10",
                            style: TextStyle(
                              color: Color(0xFFfff3c2),
                              fontSize: 30,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.all(5.0),
                        //  padding: EdgeInsets.all(0.0),
                      ),
                      Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(
                          child: Text(
                            "$elapsedSeconds",
                            style: TextStyle(
                              color: Color(0xFFfff3c2),
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Q.${quizHelper.results[currentQustion].question}",
                    style: TextStyle(
                      fontFamily: "A760-Roman",
                      fontSize: 30,
                      color: Color(0xFFfff3c2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Column(
                    children: quizHelper
                        .results[currentQustion].incorrectAnswers
                        .map((option) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: RaisedButton(
                          onPressed: () {
                            checkAnswer(option);
                          },
                          color: Color(0xFF3F4D8B),
                          colorBrightness: Brightness.dark,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "A760-Roman",
                              color: Color(0xFFfff3c2),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Color(0xFF16235B),
        body: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      );
    }
  }
}
