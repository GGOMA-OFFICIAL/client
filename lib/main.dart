import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/HomeView.dart';
import 'view/QuizView.dart';
import 'view/CardPostView.dart';
import 'view/WorkPostView.dart';
import 'LoginView.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '34f7562a97bfec0487353991c1529ab6');
  runApp(GetMaterialApp(home: LoginPage()));
}

class Main extends StatelessWidget {
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
        title: Text('bottomNavigator'),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'card'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'work'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'quiz'),
        ],
      ),
    );
  }
}
