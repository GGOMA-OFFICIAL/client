import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'dart:convert';
import '../model/post_model.dart';

class WorkPostController extends GetxController {
  var WorkPosts = PostModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostsFromLocalJson();
  }

  Future<void> fetchPostsFromLocalJson() async {
    try {
      final String response = await rootBundle.loadString(
          'assets/test/workpost.json');
      final data = json.decode(response);
      WorkPosts.value = PostModel.fromJson(data);
    } catch (e) {
      // 오류 처리
      print('JSON 파일 로드 또는 파싱 중 오류 발생: $e');
    }
  }
}
