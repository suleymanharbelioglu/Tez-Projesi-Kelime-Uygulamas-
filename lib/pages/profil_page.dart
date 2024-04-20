import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int navBarIndex = 1;
  late double progresBarValue;
  late int ogrendigimKelimelerVar;
  late int bildigimKelimelerVar;
  late int bilArtiOgr;
  int totalKelime = 4000;
  late double tamamlanmaOrani;

  @override
  void initState() {
    super.initState();
    ogrendigimKelimelerVar = 3;
    bildigimKelimelerVar = 5;
    bilArtiOgr = ogrendigimKelimelerVar + bildigimKelimelerVar;
    tamamlanmaOrani = ((bilArtiOgr / totalKelime) * 100);
    progresBarValue = (bilArtiOgr / totalKelime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Kelimelerim",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          totalKelimeVeBar(),
          SizedBox(height: 20),
          bildikimKelimeler(),
          SizedBox(height: 20),
          ogrendigimKelimler(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
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
                "$bilArtiOgr/$totalKelime",
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
            "$bildigimKelimelerVar",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.indigo,
              ))
        ],
      ),
    );
  }

  Container ogrendigimKelimler() {
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
            "Öğrendiğim Kelimler",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 75,
          ),
          Text(
            "$ogrendigimKelimelerVar",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
          ),
          IconButton(
              onPressed: () {},
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
            builder: (context) => const HomePage(),
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

  bildigimKelimelerGuncelle() {
    // bildigimKelimelerVar = DataHelper.biliyorumList.length;
  }

  verileriYenile() {
    setState(() {
      debugPrint("verileri yenile");

      // ogrendigimKelimelerVar = DataHelper.ogrendiklerimList.length;
      // bildigimKelimelerVar = DataHelper.biliyorumList.length;
      bilArtiOgr = ogrendigimKelimelerVar + bildigimKelimelerVar;
      tamamlanmaOrani = ((bilArtiOgr / totalKelime) * 100);
      progresBarValue = (bilArtiOgr / totalKelime);
    });
  }
}
