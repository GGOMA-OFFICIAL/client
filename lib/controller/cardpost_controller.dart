import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'dart:convert';
import '../model/cardpost_model.dart';

class CardPostController extends GetxController{
  var Cards = CardPostModel().obs;

  @override
  void onInit(){
    super.onInit();
    fetchCardsFromLocalJson();
  }
  Future<void> fetchCardsFromLocalJson() async{
    try {
      final String response = await rootBundle.loadString(
          'assets/test/workpost_m.json');
      final data = json.decode(response);
      Cards.value = CardPostModel.fromJson(data);
    } catch (e) {
      // 오류 처리
      print('JSON 파일 로드 또는 파싱 중 오류 발생: $e');
    }
  }
}

