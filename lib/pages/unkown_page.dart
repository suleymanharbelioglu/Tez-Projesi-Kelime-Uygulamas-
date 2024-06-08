import 'package:flutter/material.dart';
import 'package:flutter_application_3/data%20helper/data_helper.dart';

class UnKnonwnWordsPage extends StatefulWidget {
  const UnKnonwnWordsPage({super.key});

  @override
  State<UnKnonwnWordsPage> createState() => _UnKnonwnWordsPageState();
}

class _UnKnonwnWordsPageState extends State<UnKnonwnWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilmediğim Kelimeler"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: DataHepler.wantTolearnWords.length,
        itemBuilder: (context, index) {
          var word = DataHepler.wantTolearnWords[index];
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(word.toString()),
            ),
          );
        },
      ),
    );
  }
}
