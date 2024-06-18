import 'package:flutter/material.dart';
import 'package:flutter_application_3/data%20helper/data_helper.dart';
import 'package:flutter_application_3/pages/home_page.dart';
import 'package:flutter_application_3/pages/known_word_page.dart';
import 'package:flutter_application_3/pages/unkown_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int navBarIndex = 1;
  late double progresBarValue;
  late int bilmedigimKelimeler;
  late int bildigimKelimeler;
  int totalKelime = DataHepler.totalWords;
  late double tamamlanmaOrani;

  @override
  void initState() {
    print("profile init");
    super.initState();
    bildigimKelimeler = DataHepler.learnedWords.length;
    bilmedigimKelimeler = DataHepler.wantTolearnWords.length;
    tamamlanmaOrani = ((bildigimKelimeler / totalKelime) * 100);
    progresBarValue = (bildigimKelimeler / totalKelime);
  }

  @override
  Widget build(BuildContext context) {
    print("profile builder");
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: appbar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          totalKelimeVeBar(),
          SizedBox(height: 20),
          bildikimKelimeler(),
          SizedBox(height: 20),
          bilmedigimKelimelerr(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        "Kelimelerim",
        style: TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.w400),
      ),
    );
  }

  Container totalKelimeVeBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "% ${tamamlanmaOrani.toStringAsFixed(2)} tamamlandı",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "$bildigimKelimeler/$totalKelime",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: progresBarValue,
            backgroundColor: Colors.grey.shade200,
            minHeight: 15,
          ),
        ],
      ),
    );
  }

  Container bildikimKelimeler() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bildiğim Kelimler",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 75,
          ),
          Text(
            "$bildigimKelimeler",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => KnonwnWordsPage(
                    onUpdate: onUpdate,
                  ),
                ));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.indigo,
              ))
        ],
      ),
    );
  }

  Container bilmedigimKelimelerr() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bilmediğim Kelimler",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 75,
          ),
          Text(
            "$bilmedigimKelimeler",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UnKnonwnWordsPage(),
                ));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.indigo,
              ))
        ],
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: navBarIndex,
      onTap: (value) {
        if (value == 0) {
          setState(() {
            navBarIndex = value;
          });
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Anasayfa"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profil"),
      ],
    );
  }


  onUpdate() {
    setState(() {
      bildigimKelimeler = DataHepler.learnedWords.length;
      bilmedigimKelimeler = DataHepler.wantTolearnWords.length;
      tamamlanmaOrani = ((bildigimKelimeler / totalKelime) * 100);
      progresBarValue = (bildigimKelimeler / totalKelime);
    });
  }
}
