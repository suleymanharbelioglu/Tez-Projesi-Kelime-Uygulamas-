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
    print("main page builder");
    DataHepler.readWordsJson(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
