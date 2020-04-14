import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _score = 0;
  List<Question> _questions = [
    Question('Has he played for Sporting CP before?', true),
    Question('Has he ever won a world cup?', false),
    Question('Did he play in PSG', true),
    Question('Does he play in france?', true),
    Question('Do they have the most champions league?', true),
    Question('Has he ever coached Arsenal?', false),
    Question('Did he win chamions league in 2005?', true),
    Question('He is premier league all time top scorer.', false),
    Question('Has he won the world best player award?', true),
    Question('He is serieA all time top scorer.', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  int getQuestionsLength() {
    return _questions.length;
  }

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    }
    return false;
  }

  void updateScore() {
    _score++;
  }

  String getScore() {
    int totalScore = _questions.length;
    return 'You scored $_score out of $totalScore';
  }
}
