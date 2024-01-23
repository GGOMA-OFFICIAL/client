import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:social_login_app/login_platform.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void loginKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('로그인 성공 !');
      } catch (e) {
        print('로그인 실패 ${e}');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리
        if (e is PlatformException && e.code == 'CANCELED') return;
      }

      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('로그인 성공 !');
      } catch (e) {
        print('로그인 실패 ${e}');
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('로그인 성공 !');
      } catch (e) {
        print('로그인 실패 ${e}');
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
                  onTap: () {
                    // 카카오 로그인
                    loginKakao();
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
