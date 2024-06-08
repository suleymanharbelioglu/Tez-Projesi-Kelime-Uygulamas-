import 'package:flutter/material.dart';
import 'package:flutter_application_3/data%20helper/data_helper.dart';
import 'package:flutter_application_3/models/question_model.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  late Question _question;
  bool _isAnswered = false;
  Color _answerColor1 = Colors.grey.shade100;
  Color _answerColor2 = Colors.grey.shade100;
  Color _answerColor3 = Colors.grey.shade100;
  Color _answerColor4 = Colors.grey.shade100;
  @override
  void initState() {
    newQuestionFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pratik Sayfası"),
      ),
      body: DataHepler.wantTolearnWords.length > 0
          ? Card(
              child: Column(
                children: [
                  Expanded(
                    child: questionFunc(_question),
                  ),
                  answer1Func(_question.answers[0]),
                  answer2Func(_question.answers[1]),
                  answer3Func(_question.answers[2]),
                  answer4Func(_question.answers[3]),
                ],
              ),
            )
          : Center(
              child: Text("Yeni Kelimeler Seçin"),
            ),
    );
  }

  InkWell questionFunc(Question question) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
        ),
        child: Text(
          question.question,
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }

  Padding answer1Func(Answer answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print("answer1 ontap");
          if (!_isAnswered) {
            setState(() {
              _isAnswered = true;
              print("isAnswerd chnaged : $_isAnswered");

              if (answer.isCorrect) {
                _answerColor1 = Colors.green;
                DataHepler.increaseWordIsCorretNum(answer.key);
              } else {
                showTrueAnswerIfAnswerFalse();
                _answerColor1 = Colors.red;
                DataHepler.resetIsCorrectNum(answer.key);
              }
            });
          } else {
            print("is answerd : $_isAnswered");
          }
          DelayAfterAnswer(answer.isCorrect);
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.3,
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                offset: const Offset(5, 3),
                color: Colors.grey,
              ),
            ],
            color: _answerColor1,
          ),
          child: Center(
            child: Text(
              answer.answer,
              style: const TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
    );
  }

  Padding answer2Func(Answer answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print("answer1 ontap");
          if (!_isAnswered) {
            setState(() {
              _isAnswered = true;
              print("isAnswerd chnaged : $_isAnswered");

              if (answer.isCorrect) {
                _answerColor2 = Colors.green;
                DataHepler.increaseWordIsCorretNum(answer.key);
              } else {
                showTrueAnswerIfAnswerFalse();

                _answerColor2 = Colors.red;
                DataHepler.resetIsCorrectNum(answer.key);
              }
            });
          } else {
            print("is answerd : $_isAnswered");
          }
          DelayAfterAnswer(answer.isCorrect);
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.3,
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                offset: const Offset(5, 3),
                color: Colors.grey,
              ),
            ],
            color: _answerColor2,
          ),
          child: Center(
            child: Text(
              answer.answer,
              style: const TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
    );
  }

  Padding answer3Func(Answer answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print("answer1 ontap");
          if (!_isAnswered) {
            setState(() {
              _isAnswered = true;
              print("isAnswerd chnaged : $_isAnswered");

              if (answer.isCorrect) {
                _answerColor3 = Colors.green;
                DataHepler.increaseWordIsCorretNum(answer.key);
              } else {
                showTrueAnswerIfAnswerFalse();

                _answerColor3 = Colors.red;
                DataHepler.resetIsCorrectNum(answer.key);
              }
            });
          } else {
            print("is answerd : $_isAnswered");
          }
          DelayAfterAnswer(answer.isCorrect);
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.3,
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                offset: const Offset(5, 3),
                color: Colors.grey,
              ),
            ],
            color: _answerColor3,
          ),
          child: Center(
            child: Text(
              answer.answer,
              style: const TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
    );
  }

  Padding answer4Func(Answer answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print("answer1 ontap");
          if (!_isAnswered) {
            setState(() {
              _isAnswered = true;
              print("isAnswerd chnaged : $_isAnswered");

              if (answer.isCorrect) {
                _answerColor4 = Colors.green;
                DataHepler.increaseWordIsCorretNum(answer.key);
              } else {
                showTrueAnswerIfAnswerFalse();

                _answerColor4 = Colors.red;
                DataHepler.resetIsCorrectNum(answer.key);
              }
            });
          } else {
            print("is answerd : $_isAnswered");
          }
          DelayAfterAnswer(answer.isCorrect);
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.3,
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                offset: const Offset(5, 3),
                color: Colors.grey,
              ),
            ],
            color: _answerColor4,
          ),
          child: Center(
            child: Text(
              answer.answer,
              style: const TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
    );
  }

  void newQuestionFunc() {
    _isAnswered = false;
    _answerColor1 = Colors.grey.shade100;
    _answerColor2 = Colors.grey.shade100;
    _answerColor3 = Colors.grey.shade100;
    _answerColor4 = Colors.grey.shade100;
    if (DataHepler.wantTolearnWords.length > 0) {
      _question = DataHepler.giveMeQuestion();
      setState(() {});
    }
  }

  DelayAfterAnswer(bool isAnswerTrue) {
    print("delay start");
    if (isAnswerTrue) {
      Future.delayed(
        Duration(milliseconds: 800),
        () {
          newQuestionFunc();
        },
      );
    } else {
      Future.delayed(
        Duration(milliseconds: 2000),
        () {
          newQuestionFunc();
        },
      );
    }
  }

  showTrueAnswerIfAnswerFalse() {
    print("true answer index : ${DataHepler.trueAnswerIndex}");
    switch (DataHepler.trueAnswerIndex) {
      case 0:
        _answerColor1 = Colors.green;
        print("color 1 changed");
        break;
      case 1:
        _answerColor2 = Colors.green;
        print("color 2 changed");

        break;
      case 2:
        _answerColor3 = Colors.green;
        print("color 3 changed");

        break;
      case 3:
        _answerColor4 = Colors.green;

        print("color 4 changed");

        break;
    }
  }
}
