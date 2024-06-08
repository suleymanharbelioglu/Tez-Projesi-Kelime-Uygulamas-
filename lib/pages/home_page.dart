import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/choose_words.dart';
import 'package:flutter_application_3/pages/practice_page.dart';
import 'package:flutter_application_3/pages/profil_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navBarIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: PratikYap(context),
            ),
            Expanded(
              flex: 2,
              child: KelimeSec(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: navBarIndex,
      onTap: (value) {
        setState(() {
          navBarIndex = value;
        });
        if (value == 1) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ProfilePage(),
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

  PratikYap(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PracticePage(),
          ));
        },
        child: Ink(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 71, 90, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              "Pratik Yap",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  KelimeSec(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChooseWords(),
          ));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Ink(
            height: 90,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 142, 182, 238),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kelime Sec",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Öğrenmek istediğin Kelimeleri Seç",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          "WORD 1000",
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
