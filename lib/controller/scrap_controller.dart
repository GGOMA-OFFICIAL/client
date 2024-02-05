import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'dart:convert';
import '../model/scrap_model.dart';

class ScrapController extends GetxController {
  var Scraps = ScrapModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchScrapsFromLocalJson();
  }

  Future<void> fetchScrapsFromLocalJson() async {
    try {
      final String response = await rootBundle.loadString(
          'assets/test/scrap.json');
      final data = json.decode(response);
      Scraps.value = ScrapModel.fromJson(data);
    } catch (e) {
      // 오류 처리
      print('JSON 파일 로드 또는 파싱 중 오류 발생: $e');
    }
  }

  Future<bool> getScrapStatus(int postId) async {
    // JSON 파일 로드
    final String response = await rootBundle.loadString('assets/test/scrap.json');
    final Map<String, dynamic> jsonData = json.decode(response);


    // scrapStatus 내에서 주어진 postId에 대한 값을 찾아 반환
    return jsonData['scrapStatus'][postId.toString()] ?? false;
  }
}
