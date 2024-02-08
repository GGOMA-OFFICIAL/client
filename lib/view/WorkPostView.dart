import 'package:get/get.dart';
import '../controller/workpost_controller.dart';
import '../controller/workscrap_controller.dart';
import 'package:flutter/material.dart';

import 'Post.dart';

class WorkPostPage extends StatefulWidget {
  const WorkPostPage({super.key});

  @override
  State<WorkPostPage> createState() => _WorkPostPageState();
}

class _WorkPostPageState extends State<WorkPostPage> {
  final WorkPostController postcontroller = Get.put(WorkPostController());
  final WorkScrapController scrapcontroller = Get.put(WorkScrapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60 / 2.5),
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 60 / 2.5),
                  Text(
                    '아르바이트 전 알아두면 좋을 정보',
                    style: TextStyle(
                      color: Color(0xffFFBC0E),
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w800,
                      fontSize: 56 / 2.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48 / 2.5),
              Expanded(
                // ListView.builder를 Expanded로 감싸기
                child: ListView.builder(
                  itemCount: postcontroller.WorkPosts.value.totaldatacount,
                  shrinkWrap: true, // shrinkWrap 설정
                  itemBuilder: (context, index) {
                    final posts = postcontroller.WorkPosts.value.data?[index];
                    final scraps = scrapcontroller.getScrapStatus(index);
                    return Column(
                      children: [
                        posts != null
                            ?  WorkPost(
                                    data: posts,
                                    scrap: scraps,
                                  )
                            : Text("error"), // 또는 적절한 대체 위젯

                        // Post(data: posts),
                        SizedBox(
                          height: 40 / 2.5,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
