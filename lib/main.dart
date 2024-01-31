import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginView.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '34f7562a97bfec0487353991c1529ab6');
  runApp(GetMaterialApp(home: LoginPage()));
}
