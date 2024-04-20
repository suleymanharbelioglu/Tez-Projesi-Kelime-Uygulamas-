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

  Word({
    required this.word,
    required this.mean,
    required this.isWantedToLearn,
    required this.isLearned,
    required this.correctAnswer,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        word: json["word"],
        mean: json["mean"],
        isWantedToLearn: json["isWantedToLearn"],
        isLearned: json["isLearned"],
        correctAnswer: json["correctAnswer"],
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "mean": mean,
        "isWantedToLearn": isWantedToLearn,
        "isLearned": isLearned,
        "correctAnswer": correctAnswer,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "$word - $mean";
  }
}
