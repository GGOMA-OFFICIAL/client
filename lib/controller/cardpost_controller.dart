import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'dart:convert';
import '../model/post_model.dart';

class CardPostController extends GetxController {
  var CardPosts = PostModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostsFromLocalJson();
  }

  Future<void> fetchPostsFromLocalJson() async {
    try {
      final String response = await rootBundle.loadString(
          'assets/test/cardpost.json');
      final data = json.decode(response);
      CardPosts.value = PostModel.fromJson(data);
    } catch (e) {
      // 오류 처리
      print('JSON 파일 로드 또는 파싱 중 오류 발생: $e');
    }
  }
}
