import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'dart:convert';
import '../model/postmodal_model.dart';

class WorkPostModalController extends GetxController{
  var Works = PostModalModel().obs;

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
      Works.value = PostModalModel.fromJson(data);
    } catch (e) {
      // 오류 처리
      print('JSON 파일 로드 또는 파싱 중 오류 발생: $e');
    }
  }
}

