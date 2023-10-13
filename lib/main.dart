import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(
          title: Text('Who Said it?',
            style: TextStyle(color: Colors.white),),

          backgroundColor: Colors.purple[800],

        ),
        backgroundColor: Colors.purple[600],
        body: SafeArea(

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),

          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> still = [];
  List<Icon> scoreKeeper = [
    Icon(
      Icons.arrow_forward,
      color: Colors.black,
    )
  ];
  int score = 0;
  int recycle = 0;


  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {

      if (recycle == 10){
        recycle = 0;
        scoreKeeper.clear();
        scoreKeeper.add(Icon(
            Icons.arrow_forward
        ));

      }
//      if (recycle == 20){
//        int recycle = 0;
//        scoreKeeper.clear();
//        scoreKeeper.add(Icon(
//            Icons.arrow_forward
//        ));
//
//      }

      if (quizBrain.isFinished() == true) {
        Alert(
            context: context,
            title: "CONGRATULATIONS!",
            desc: "You completed the quiz with score of $score/30")
            .show();
        quizBrain.reset();
        scoreKeeper.clear();
        scoreKeeper.add(Icon(
            Icons.arrow_forward
        ));
      }




      if (userPickedAnswer == correctAnswer) {
        score++;
        recycle++;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        recycle++;

        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();

      if (quizBrain.isFinished() == true) {
        Alert(
            context: context,
            title: "CONGRATULATIONS!",
            desc: "You completed the quiz with score of $score/30")
            .show();
        quizBrain.reset();
        scoreKeeper.clear();
        score = 0;

        scoreKeeper.add(Icon(
            Icons.arrow_forward
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(

              flex: 5,
              child: Padding(

                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      color: Color.fromARGB(255, 244, 209, 60),
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                      child: SizedBox(
                        height: 80,
                        child: Center(
                          child: Text(
                            quizBrain.getQuestionText(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/friends.jpg"),
                  fit: BoxFit.cover,
                ),
              ),

//          child: Image(
//            image: AssetImage('images/pngfuel.com.png'),


            )

//          ),
        ),


        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 244, 209, 60),
                  child: Text(
                    'Ross',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    checkAnswer('Ross');
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: FlatButton(
                  color: Color.fromARGB(255, 244, 209, 60),
                  child: Text(
                    'Rachel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    checkAnswer('Rachel');
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: FlatButton(
                  color: Color.fromARGB(255, 244, 209, 60),
                  child: Text(
                    'Chandler',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    //The user picked false.
                    checkAnswer('Chandler');
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: FlatButton(
                  color: Color.fromARGB(255, 244, 209, 60),
                  child: Text(
                    'Monica',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    checkAnswer('Monica');
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 00, 5, 5),
                child: FlatButton(
                  color: Color.fromARGB(255, 244, 209, 60),
                  child: Text(
                    'Joey',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    //The user picked false.
                    checkAnswer('Joey');
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 00, 5, 5),
                child: FlatButton(
                  color: Color.fromARGB(255, 244, 209, 60),
                  child: Text(
                    'Phoebe',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    checkAnswer('Phoebe');
                  },
                ),
              ),
            ),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[

          ],
        ),



        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            children: scoreKeeper,

          ),
        ),



      ],

    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
