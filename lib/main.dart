import 'package:flutter/material.dart';
import 'package:flutter_application_3/data%20helper/data_helper.dart';
import 'package:flutter_application_3/pages/home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataHepler.readWordsJson(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word 1000',
      home: HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
