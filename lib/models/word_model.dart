// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final word = wordFromJson(jsonString);

import 'dart:convert';

Word wordFromJson(String str) => Word.fromJson(json.decode(str));

String wordToJson(Word data) => json.encode(data.toJson());

class Word {
  String word;
  String mean;
  bool isWantedToLearn;
  bool isLearned;
  int correctAnswer;
  int num;

  Word({
    required this.word,
    required this.mean,
    required this.isWantedToLearn,
    required this.isLearned,
    required this.correctAnswer,
    required this.num,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        word: json["word"],
        mean: json["mean"],
        isWantedToLearn: json["isWantedToLearn"],
        isLearned: json["isLearned"],
        correctAnswer: json["correctAnswer"],
        num: json["num"],
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "mean": mean,
        "isWantedToLearn": isWantedToLearn,
        "isLearned": isLearned,
        "correctAnswer": correctAnswer,
        "num": num,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "$word - $mean";
  }
}
