import './HomeView.dart';
import './QuizView.dart';
import './CardPostView.dart';
import './WorkPostView.dart';
import './SettingView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './SearchView.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final List<Widget> _pages = [
    HomePage(),
    CardPostPage(),
    WorkPostPage(),
    QuizPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 35,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          onPressed: () {
            Get.to(() => SettingPage());
          },
        ),
        backgroundColor: Color(0xffFFDF6C),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              iconSize: 35,
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              onPressed: () {
                Get.to(() => SearchPage());
              }),
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        selectedItemColor: Color(0xFFFFBC0E),
        unselectedItemColor: Color(0xFF494949),
        showUnselectedLabels: true, // 선택되지 않은 라벨 표시
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Card'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Work'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'quiz'),
        ],
      ),
    );
  }
}
