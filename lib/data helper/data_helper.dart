import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/word_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DataHepler {
  static List<Word> baseWords = [];
  static List<Word> wantTolearnWords = [];
  static List<Word> learnedWords = [];
  static int totalWords = 20;
  static int maxChosenWord = 10;
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
      if (controlerMaxChosenWord()) {
        word.isWantedToLearn = true;
        wantTolearnWords.add(word);
        print("wanted to learn word list --------------------------");
        print(wantTolearnWords);
        pageController.nextPage(
            duration: const Duration(milliseconds: 750), curve: Curves.ease);
      }
    } else {
      word.isWantedToLearn = false;
      wantTolearnWords.remove(word);
      print("wanted to learn word list --------------------------");
      pageController.nextPage(
          duration: const Duration(milliseconds: 750), curve: Curves.ease);
    }
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

  static bool controlerMinChosenWord() {
    if (DataHepler.wantTolearnWords.length < minChosenWord) {
      EasyLoading.showToast("en az ${minChosenWord} öğrenilecek kelime seçin",
          toastPosition: EasyLoadingToastPosition.center);
      print("en az ${minChosenWord} öğrenilecek kelime seçin");
      return false;
    } else {
      print("çalışmaya başlayabilirsiniz");
      return true;
    }
  }

  static bool controlerMaxChosenWord() {
    if (DataHepler.wantTolearnWords.length >= maxChosenWord) {
      EasyLoading.showToast(
          "en fazle ${maxChosenWord} öğrenilecek kelime seçebilirsiniz.Pratik yapmaya başlayın",
          duration: Duration(seconds: 2));

      print(
          "en fazle ${maxChosenWord} öğrenilecek kelime seçebilirsiniz.Pratik yapmaya başlayın");
      return false;
    } else {
      return true;
    }
  }
}
