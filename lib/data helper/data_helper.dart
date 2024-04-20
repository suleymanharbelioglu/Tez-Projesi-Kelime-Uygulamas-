import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/word_model.dart';

class DataHepler {
  static List<Word> allWords = [];
  static List<Word> wantTolearnWords = [];
  static List<Word> learnedWords = [];

  static int minChosenWord = 3;
  static int maxChosenWord = 20;

  static readWordsJson(BuildContext context) async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/words.json");
    var jsonObject = jsonDecode(okunanString);

    allWords = (jsonObject as List)
        .map((arabaMap) => Word.fromJson(arabaMap))
        .toList();
    print(allWords);
  }
}
