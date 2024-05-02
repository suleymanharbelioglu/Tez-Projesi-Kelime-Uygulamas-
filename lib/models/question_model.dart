// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  String question;
  List<Answer> answers;
  Question({
    required this.question,
    required this.answers,
  });
  @override
  String toString() {
    return "qustion : $question - answerrs : $answers";
  }
}

class Answer {
  String answer;
  bool isCorrect;
  int key;
  Answer({
    required this.answer,
    required this.isCorrect,
    required this.key,
  });
  @override
  String toString() {
    return "anwer : $answer - iscorret : $isCorrect - key : $key";
  }
}
