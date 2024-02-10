import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/cardpost_controller.dart';
import '../controller/cardscrap_controller.dart';

import 'Post.dart';


class CardPostPage extends StatefulWidget {
  const CardPostPage({super.key});

  @override
  State<CardPostPage> createState() => _CardPostPageState();
}

class _CardPostPageState extends State<CardPostPage> {
  final CardPostController postcontroller = Get.put(CardPostController());
  final CardScrapController scrapcontroller = Get.put(CardScrapController());

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
                    '카드 발급 전 알아두면 좋을 정보',
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
                  itemCount: postcontroller.CardPosts.value.totaldatacount,
                  shrinkWrap: true, // shrinkWrap 설정
                  itemBuilder: (context, index) {
                    final posts = postcontroller.CardPosts.value.data?[index];
                    final scraps = scrapcontroller.getScrapStatus(index);
                    return Column(
                      children: [
                        posts != null
                            ?  CardPost(
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



