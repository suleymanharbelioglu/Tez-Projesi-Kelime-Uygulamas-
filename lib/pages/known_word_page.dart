// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_3/data%20helper/data_helper.dart';

class KnonwnWordsPage extends StatefulWidget {
  const KnonwnWordsPage({
    Key? key,
    required this.onUpdate,
  }) : super(key: key);
  final Function onUpdate;
  @override
  State<KnonwnWordsPage> createState() => _KnonwnWordsPageState(); 
}

class _KnonwnWordsPageState extends State<KnonwnWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.onUpdate();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Bildiğim Kelimeler"),
        actions: [
          Center(
            child: Text(
              DataHepler.learnedWords.length.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: DataHepler.learnedWords.length,
        itemBuilder: (context, index) {
          var word = DataHepler.learnedWords[index];
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(word.toString()),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      word.isLearned = false;
                      DataHepler.learnedWords.remove(word);
                      if (!DataHepler.baseWords.contains(word)) {
                        DataHepler.baseWords.add(word);
                      }
                    });
                  },
                  icon: const Icon(Icons.exit_to_app_sharp)),
            ),
          );
        },
      ),
    );
  }
}
