import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
//  Questions questions = Questions;
  List<Icon> tracker = [];

  @override
  Widget build(BuildContext context) {
    int pictureNumber = quizBrain.getQuestionNumber();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Soccer Quiz App',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('images/picture$pictureNumber.jpg'),
                  fit: BoxFit.fill),
            ),
//            constraints: BoxConstraints.expand(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          color: Colors.black,
                          child: Text(
                            quizBrain.getQuestionText(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            updateAnswer(true);
                          });
                          //The user picked true.
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        color: Colors.red,
                        child: Text(
                          'False',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          //The user picked false.
                          setState(() {
                            updateAnswer(false);
                          });
                        },
                      ),
                    ),
                  ),
                  //TODO: Add a Row here as your score keeper
                  Container(
                    color: Colors.black,
                    child: Row(
                      children: tracker,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  dynamic updateAnswer(bool state) {
    if (quizBrain.isFinished() == true) {
      String result = quizBrain.getScore();
      Alert(context: context, title: "QUIZ", desc: result).show();
      tracker = [];
      quizBrain.reset();
    } else {
      setState(() {
        if (state == quizBrain.getCorrectAnswer()) {
          tracker.add(
            Icon(Icons.check, color: Colors.green),
          );
          quizBrain.updateScore();
        } else {
          tracker.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        quizBrain.nextQuestion();
      });
    }
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
