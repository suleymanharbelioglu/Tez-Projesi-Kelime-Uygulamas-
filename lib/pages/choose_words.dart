import 'package:flutter/material.dart';
import 'package:flutter_application_3/data%20helper/data_helper.dart';
import 'package:flutter_application_3/models/word_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChooseWords extends StatefulWidget {
  const ChooseWords({super.key});

  @override
  State<ChooseWords> createState() => _ChooseWordsState();
}

class _ChooseWordsState extends State<ChooseWords> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    print("chose word init");
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    print("chose word builder");
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: appbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          circularPercentIndicator(),
          wordCardsPageview(),
        ],
      ),
    );
  }

  Expanded wordCardsPageview() {
    return Expanded(
      flex: 3,
      child: Container(
        child: DataHepler.baseWords.length > 0
            ? PageView.builder(
                controller: pageController,
                itemCount: DataHepler.baseWords.length,
                itemBuilder: (context, index) {
                  var word = DataHepler.baseWords[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 6,
                          child: SizedBox(height: 60),
                        ),
                        // kelimenin ingilizcesi
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            word.word,
                            style: const TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(height: 10),
                        ),
                        // kelime anlamı
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            word.mean,
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: SizedBox(height: 60),
                        ),
                        ogrenmekIstiyorumButton(word),
                        Expanded(
                          flex: 1,
                          child: SizedBox(height: 20),
                        ),
                        biliyorumButton(word),
                        Expanded(
                          flex: 2,
                          child: SizedBox(height: 20),
                        ),
                      ],
                    ),
                  );
                },
              )
            : SizedBox(),
      ),
    );
  }

  Expanded circularPercentIndicator() {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          // oran halkası
          Container(
            child: Center(
              child: CircularPercentIndicator(
                radius: 100,
                lineWidth: 15,
                percent: DataHepler.wantTolearnWords.length /
                    DataHepler.maxChosenWord,
                backgroundColor: Colors.blue.shade200,
                progressColor: Colors.white,
              ),
            ),
          ),
          Container(
            // color: Colors.red.shade100,
            child: Center(
                child: Text(
              "${DataHepler.wantTolearnWords.length}/${DataHepler.maxChosenWord}",
              style: const TextStyle(fontSize: 36, color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      toolbarHeight: 75,
      leading: IconButton(
        onPressed: () {
          if (DataHepler.controlerMinChosenWord()) {
            Navigator.of(context).pop();
            DataHepler.updatebaseWordsList();
          }
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
          child: Text(
        "Kelime Seç",
        style: TextStyle(fontSize: 30),
      )),
      actions: [
        SizedBox(width: 60),
      ],
    );
  }

  biliyorumButton(Word word) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {
          setState(() {
            DataHepler.biliyorumButton(word, pageController);
          });
        },
        child: Ink(
          child: Center(
            child: const Text(
              "Biliyorum",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }

  ogrenmekIstiyorumButton(Word word) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: word.isWantedToLearn ? Colors.grey : Colors.green,
      ),
      child: InkWell(
        onTap: () {
            setState(() {
              DataHepler.ogrenmekIstiyorumButton(word, pageController);
            });
          
        },
        child: Ink(
          // alignment: Alignment.center,

          child: word.isWantedToLearn
              ? Center(
                  child: const Text(
                    "Geri Al",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                )
              : Center(
                  child: const Text(
                    "Öğrenmek İstiyorum",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
        ),
      ),
    );
  }
}
