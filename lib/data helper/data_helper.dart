import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/question_model.dart';
import 'package:flutter_application_3/models/word_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DataHepler {
  // uygulamadaki bütün kelimeleri içerir
  static List<Word> allWords = [];
  // uyuglamada öğrenilmek istenmeyen ve öğrenilmiş olmayan kelimeleri içerir
  static List<Word> baseWords = [];
  // öğrenilmek istenen kelimeleri içerir
  static List<Word> wantTolearnWords = [];
  // öğrenilmiş kelimeleri içerir
  static List<Word> learnedWords = [];
  // uyugulamadaki bütün kelieme sayısı
  static int totalWords = 430;
  // öğrenilmek için seçilebilecek max kelime sayısı
  static int maxChosenWord = 50;
  // öğrenilmek istenin min kelime sayısı
  static int minChosenWord = 20;

  // json dosyasından verileri okur , word modeline çeviri baseWords listesine hepsini ekler
  static readWordsJson(BuildContext context) async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/words.json");
    var jsonObject = jsonDecode(okunanString);

    baseWords = (jsonObject as List)
        .map((arabaMap) => Word.fromJson(arabaMap))
        .toList();
    allWords.addAll(baseWords);
    print("base words list ");
    print(baseWords);
    print("*********************************************");
    print("all words");
    print(allWords);
  }

  // igili kelime learned  liste eklenmemişse çalışır
  // tolearnListe kelime ekler eklenmişse çıkarır
  static ogrenmekIstiyorumButton(Word word, PageController pageController) {
    if (word.isLearned == false) {
      if (word.isWantedToLearn == false &&
          wantTolearnWords.contains(word) == false) {
        if (controlerMaxChosenWord()) {
          word.isWantedToLearn = true;
          wantTolearnWords.add(word);
          pageController.nextPage(
              duration: const Duration(milliseconds: 750), curve: Curves.ease);
          print("$word : added to wantoLearnList");
          print("want to learn list");
          print(wantTolearnWords);
        }
      } else {
        word.isWantedToLearn = false;
        wantTolearnWords.remove(word);
        print("$word : removed form wantoLearnList");
        print("want to learn list");
        print(wantTolearnWords);
      }
    }
  }

  // ilgili kelime toLeranListe eklenmemişse çalışır
  // learned liste kelime ekler eklenmişse çıkarır
  static biliyorumButton(Word word, PageController pageController) {
    if (word.isWantedToLearn == false) {
      if (!learnedWords.contains(word) && word.isLearned == false) {
        word.isLearned = true;
        learnedWords.add(word);
        pageController.nextPage(
            duration: const Duration(milliseconds: 750), curve: Curves.ease);
        print("$word : added to learnedList");
        print(" learn list");
        print(learnedWords);
      } else {
        word.isLearned = false;
        learnedWords.remove(word);
        print("$word : removed learnedList");
        print(" learn list");
        print(learnedWords);
      }
    }
  }

  // toLearn ve learned listelerine eklenen kelimeleri base listten çıkarr
  static updatebaseWordsList() {
    baseWords = baseWords
        .where((word) =>
            (!wantTolearnWords.contains(word) && !learnedWords.contains(word)))
        .toList();
    print("base word updateed ------------------------------------------");
    print(baseWords);
    print("all words ---------------------------------------------------");
    print(allWords);
  }

  // öğrenilecek min kelime sayısını ulaşıldıysa true değilse false döner
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

  // öğrenilecek max kelimeye ulaşılmadıysa true değilse false döner
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

  // toLearnListesinden random bir kelime seçer
  // Question nesnesi döndürür
  static Question giveMeQuestion() {
    switch (Random().nextInt(2)) {
      case 0:
        return giveMeIngQuestion();
      case 1:
        return givemeTrQuestion();
      default:
        return Question(question: "errorQ", answers: []);
    }
  }

  static Question givemeTrQuestion() {
    int questionIndex = giveMeIndexFromWantoLearnList();
    var questionWord = wantTolearnWords[questionIndex];
    print("soru içini seçilen kelime nesnesi : $questionWord");
    List<int> answerWordIndexList =
        giveMe3DifIndexFromAllWord(questionWord.word);
    switch (Random().nextInt(4)) {
      case 0:
        var question = Question(
          question: wantTolearnWords[questionIndex].mean,
          answers: [
            Answer(
                answer: wantTolearnWords[questionIndex].word,
                isCorrect: true,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[0]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].word,
                isCorrect: false,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;

      case 1:
        var question = Question(
          question: wantTolearnWords[questionIndex].mean,
          answers: [
            Answer(
                answer: allWords[answerWordIndexList[0]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: wantTolearnWords[questionIndex].word,
                isCorrect: true,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].word,
                isCorrect: false,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;
      case 2:
        var question = Question(
          question: wantTolearnWords[questionIndex].mean,
          answers: [
            Answer(
                answer: allWords[answerWordIndexList[0]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: wantTolearnWords[questionIndex].word,
                isCorrect: true,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].word,
                isCorrect: false,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;
      case 3:
        var question = Question(
          question: wantTolearnWords[questionIndex].mean,
          answers: [
            Answer(
                answer: allWords[answerWordIndexList[0]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].word,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: wantTolearnWords[questionIndex].word,
                isCorrect: true,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;
      default:
        return Question(question: "errorQ", answers: []);
    }
  }

  static Question giveMeIngQuestion() {
    int questionIndex = giveMeIndexFromWantoLearnList();
    var questionWord = wantTolearnWords[questionIndex];
    print("soru içini seçilen kelime nesnesi : $questionWord");
    List<int> answerWordIndexList =
        giveMe3DifIndexFromAllWord(questionWord.word);
    switch (Random().nextInt(4)) {
      case 0:
        var question = Question(
          question: wantTolearnWords[questionIndex].word,
          answers: [
            Answer(
                answer: wantTolearnWords[questionIndex].mean,
                isCorrect: true,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[0]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].mean,
                isCorrect: false,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;

      case 1:
        var question = Question(
          question: wantTolearnWords[questionIndex].word,
          answers: [
            Answer(
                answer: allWords[answerWordIndexList[0]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: wantTolearnWords[questionIndex].mean,
                isCorrect: true,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].mean,
                isCorrect: false,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;
      case 2:
        var question = Question(
          question: wantTolearnWords[questionIndex].word,
          answers: [
            Answer(
                answer: allWords[answerWordIndexList[0]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: wantTolearnWords[questionIndex].mean,
                isCorrect: true,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].mean,
                isCorrect: false,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;
      case 3:
        var question = Question(
          question: wantTolearnWords[questionIndex].word,
          answers: [
            Answer(
                answer: allWords[answerWordIndexList[0]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[1]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: allWords[answerWordIndexList[2]].mean,
                isCorrect: false,
                key: questionWord.num),
            Answer(
                answer: wantTolearnWords[questionIndex].mean,
                isCorrect: true,
                key: questionWord.num),
          ],
        );
        print("qustion is ready -----------------------------");
        print(question.question);
        print(question.answers);
        return question;
      default:
        return Question(question: "errorQ", answers: []);
    }
  }

  // allword listesinin uzunluğunu max alır ve bir randım sayı verir
  static int giveMeIndexFromAllWordsList() {
    var randomNum = Random().nextInt(allWords.length);
    print("random index from allwords : $randomNum");
    return randomNum;
  }

  // wantTolern listesinin uzunluğunu max alır ve randon sayı verir
  static int giveMeIndexFromWantoLearnList() {
    var randomNum = Random().nextInt(wantTolearnWords.length);
    print("random index from wanToLearnList : $randomNum");
    return randomNum;
  }

  // max ı allword liste uzunluğu olan ve birbirinden farklı 3 random sayı verir
  // sayıların allword listesindeki yerindeki kelime stringleri alınan stringten farklıdır
  static List<int> giveMe3DifIndexFromAllWord(String questionString) {
    List<int> answerIndexList = [];
    late int index1;
    late int index2;
    late int index3;
    for (int i = 0; i < allWords.length; i++) {
      index1 = giveMeIndexFromAllWordsList();
      if (allWords[index1].word != questionString) {
        break;
      }
    }

    for (int i = 0; i < allWords.length; i++) {
      index2 = giveMeIndexFromAllWordsList();
      if (allWords[index2].word != questionString && index2 != index1) {
        break;
      }
    }
    for (int i = 0; i < allWords.length; i++) {
      index3 = giveMeIndexFromAllWordsList();
      if (allWords[index3].word != questionString &&
          index3 != index1 &&
          index3 != index2) {
        break;
      }
    }
    answerIndexList.addAll([index1, index2, index3]);
    print("question string : $questionString");
    print("answer index List : $answerIndexList");
    print("anwer index words");
    for (int item in answerIndexList) print(allWords[item]);
    return answerIndexList;
  }
  // keime numarsı alır
  // wantToLearnListten kelimeyi bulur
  // iscorrectAnswer protertysini 1 arrtırrı 3 e ulaşmışsa kelimeyi is learned == true olarak değitirip is learned
  //listesini ekler base to learn lsitesinden çıkarır

  static increaseWordIsCorretNum(int wordNum) {
    var word =
        wantTolearnWords.where((element) => element.num == wordNum).toList()[0];
    print("isCorretAnwerWord : $word");
    if (word.correctAnswer < 3) {
      word.correctAnswer++;
      print("word corectanswer increased : ${word.correctAnswer}");
    } else {
      word.isLearned = true;
      learnedWords.add(word);
      wantTolearnWords.remove(word);

      print("$word is learned added to learned list removed from to learned");
      print("learnedWords");
      print(learnedWords);
    }
  }

  // kelimeyi num değerine göre bulur
  // iscorrectAnswer Propertysini sıfırlar
  static resetIsCorrectNum(int wordNum) {
    var word =
        wantTolearnWords.where((element) => element.num == wordNum).toList()[0];

    word.correctAnswer = 0;
    print("$word kelimesi yanlış cevaplandı");
    print("iscoorectAnswer sıfırlandı : ${word.correctAnswer}");
  }
}
