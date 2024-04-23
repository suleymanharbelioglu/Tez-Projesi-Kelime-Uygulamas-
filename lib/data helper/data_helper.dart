import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/word_model.dart';

class DataHepler {
  static List<Word> baseWords = [];
  static List<Word> wantTolearnWords = [];
  static List<Word> learnedWords = [];
  static int totalWords = 20;
  static int maxChosenWord = 20;
  static int minChosenWord = 5;

  static readWordsJson(BuildContext context) async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/words.json");
    var jsonObject = jsonDecode(okunanString);

    baseWords = (jsonObject as List)
        .map((arabaMap) => Word.fromJson(arabaMap))
        .toList();
    print(
        "base word filled from json file ----------------------------------------------");
    print(baseWords);
  }

  static ogrenmekIstiyorumButton(Word word, PageController pageController) {
    if (word.isWantedToLearn == false) {
      word.isWantedToLearn = true;
      wantTolearnWords.add(word);
      print("wanted to learn word list --------------------------");
      print(wantTolearnWords);
    } else {
      word.isWantedToLearn = false;
      wantTolearnWords.remove(word);
      print("wanted to learn word list --------------------------");
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 750), curve: Curves.ease);
  }

  static biliyorumButton(Word word, PageController pageController) {
    if (!learnedWords.contains(word)) {
      word.isLearned = true;
      learnedWords.add(word);
      print("learned words list ----------------------------------");
      print(learnedWords);
      pageController.nextPage(
          duration: const Duration(milliseconds: 750), curve: Curves.ease);
    }
  }

  static updatebaseWordsList() {
    baseWords = baseWords
        .where((word) =>
            (!wantTolearnWords.contains(word) && !learnedWords.contains(word)))
        .toList();
    print("base word updateed ------------------------------------------");
    print(baseWords);
  }
}
