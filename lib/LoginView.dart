import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'view/MainView.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<bool> loginKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('로그인 성공 !');
        return true;
      } catch (e) {
        print('로그인 실패 ${e}');
        return false;
      }

      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('로그인 성공 !');
        return true;
      } catch (e) {
        print('로그인 실패 ${e}');
        return false;
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('로그인 성공 !');
        return true;
      } catch (e) {
        print('로그인 실패 ${e}');
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: () async {
                    // 카카오 로그인
                    bool islogin = await loginKakao();
                    if (islogin) {
                      Get.off(MainPage());
                    }
                  },
                  child: Image.asset('assets/image/kakao_login.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
