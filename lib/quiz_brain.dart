import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('"We were on a break!"', 'Ross'),
    Question('"That is brand new information!"', 'Phoebe'),
    Question('"Yeah. It\'s like a cow\'s opinion. It just doesn\'t matter. It\'s moo."', 'Joey'),
    Question('"They don\'t know that we know that they know!"', 'Monica'),
    Question('"Okay, no uterus, no opinion."', 'Rachel'),
    Question('"Oh, I wish I could, but I don\'t want to."', 'Phoebe'),
    Question('"...And yet, I never run into Beyonce."', 'Chandler'),
    Question('"Guys can fake it? Unbelievable! The one thing that\'s ours!"', 'Monica'),
    Question('"Ah. Humor Based On My Pain."', 'Ross'),
    Question('“Well, maybe I don’t need your money. Wait, wait, I said maybe!”', 'Rachel'),
    Question('"God, I love how sexy I am."', 'Phoebe'),
    Question('“What’s not to like? Custard: good. Jam: good. Meat: good!”', 'Joey'),
    Question('"You have to stop the Q-Tip when there\'s resistance."', 'Chandler'),
    Question('“And I have to live with a boy!”', 'Monica'),
    Question('"I Tell You, When I Actually Die, Some People Are Going To Get Seriously Haunted!"', 'Ross'),
    Question('“You can’t just give up. Is that what a dinosaur would do?"', 'Joey'),
    Question('“Come on, Ross, you’re a paleontologist. Dig a little deeper.”', 'Phoebe'),
    Question('"You Have No Idea How Much This Hurts!"', 'Ross'),
    Question('"Three failed marriages, two illegitimate children... The personal ad writes itself."', 'Chandler'),
    Question('"13 bathrooms in this place, I threw up in a coat closet."', 'Phoebe'),
    Question('"You’re so far past the line, you can’t even see the line. The line is a dot to you."', 'Joey'),
    Question('"It’s just two people going out to dinner and not having sex."', 'Monica'),
    Question('"It’s not what you said, it’s just the way you said it."', 'Joey'),
    Question('"Your teeth? Yeah, I saw them from outside."', 'Rachel'),
    Question('“I don’t even have a ‘pla.’ ”', 'Phoebe'),
    Question('"Sure, I have my bad days, but then I remember what a cute smile I have."', 'Chandler'),
    Question('"You And Those Vegetables Have, Uh... Real Thing Going, Huh?"', 'Ross'),
    Question('"I Wonder What Age It Is That You Stop Being Able To Put Both Legs Behind Your Head."', 'Monica'),
    Question('"I think I can safely say that we all have family issues, work and/or are sick"', 'Chandler'),
    Question('"Oh. Was it how you invented the cotton gin?"', 'Rachel'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length ) {
      _questionNumber++;
    }
    else isFinished();
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }


  bool isFinished(){
    if (_questionNumber == _questionBank.length ) {
      return true;
    }
  }


  void reset(){
    _questionNumber = 0;
  }
}
