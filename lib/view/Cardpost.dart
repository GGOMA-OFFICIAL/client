import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controller/workpostmodal_controller.dart';

void card_post_modal(BuildContext context, String post_title, String tag1,
    String tag2, String post_image) {
  final WorkPostModalController cardpostcontroller = Get.put(WorkPostModalController());

  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 2040 / 2.5,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(54 / 2.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              CupertinoIcons.back,
                              size: 80 / 2.5,
                              color: Color(0xffFFBC0E),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              //todo: scrap구현할 것
                            },
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              size: 80 / 2.5,
                              color: Color(0xffFFBC0E),
                            ),
                          ),
                        ],
                      ), //뒤로가기, 북마크 아이콘
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 78 / 2.5),
                            Text(
                              post_title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xffFFBC0E),
                                fontSize: 56 / 2.5,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.bold,
                              ),
                            ), // 제목
                            SizedBox(height: 30 / 2.5),
                            Row(
                              children: [
                                Container(
                                  //tag1
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFF4CB),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8 / 2.5,
                                      bottom: 8 / 2.5,
                                      left: 24 / 2.5,
                                      right: 24 / 2.5,
                                    ),
                                    child: Text(
                                      tag1,
                                      style: TextStyle(
                                          color: Color(0xff494949),
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32 / 2.5),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16 / 2.5),
                                Container(
                                  //tag2
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFF4CB),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8 / 2.5,
                                      bottom: 8 / 2.5,
                                      left: 24 / 2.5,
                                      right: 24 / 2.5,
                                    ),
                                    child: Text(
                                      tag2,
                                      style: TextStyle(
                                          color: Color(0xff494949),
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32 / 2.5),
                                    ),
                                  ),
                                ),
                              ],
                            ), // 태그
                            SizedBox(height: 55 / 2.5),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40 / 2.5),
                              child: Image.network(
                                post_image,
                                height: 720 / 2.5,
                                width: 960 / 2.5,
                                fit: BoxFit.cover,
                              ),
                            ), // 이미지
                            SizedBox(height: 90 / 2.5),
                            ListView.builder(
                              itemCount: cardpostcontroller
                                      .Cards.value.data?.postParagraph ??
                                  1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final paragraphTitle = cardpostcontroller
                                        .Cards
                                        .value
                                        .data
                                        ?.postText?[index]
                                        .paragraphTitle ??
                                    'error !!';
                                final paragraphContents = cardpostcontroller
                                        .Cards
                                        .value
                                        .data
                                        ?.postText?[index]
                                        .paragraphContents ??
                                    '\noh my god ~';

                                return Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: paragraphTitle,
                                            style: TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36 / 2.5,
                                              color: Color(0xff1F1F1F),
                                            ),
                                          ),
                                          TextSpan(
                                            text: paragraphContents,
                                            style: TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 36 / 2.5,
                                              color: Color(0xff494949),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 90 / 2.5,
                                    )
                                  ],
                                );
                              },
                            ), // 내용
                          ],
                        ),
                      ),
                      SizedBox(height: 90 / 2.5),

                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100/2.5,
                  width: 432,
                  color: Color(0xffFFDF6C),
                  child: Text(
                    '@GGOMA',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                        color: Color(0xff494949),
                        fontSize: 20 / 2.5,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
