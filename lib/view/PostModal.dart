import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controller/workpostmodal_controller.dart';
import '../controller/cardpostmodal_controller.dart';

void workpost_modal(BuildContext context, String post_title, String tag1,
    String tag2, String post_image, Future<bool> scrapStatus) async {
  final WorkPostModalController workpostcontroller =
      Get.put(WorkPostModalController());

  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
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
                            icon: const Icon(
                              CupertinoIcons.back,
                              size: 80 / 2.5,
                              color: Color(0xffFFBC0E),
                            ),
                          ),
                          FutureBuilder<bool>(
                            future: scrapStatus,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // 데이터 로딩 중
                                return CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                print('Error: ${snapshot.error}');
                                // 에러 처리
                                return Text('error');
                              }
                              bool isScrapped = snapshot.data ?? false;
                              return Row(
                                children: [
                                  const SizedBox(width: 177),
                                  IconButton(
                                    iconSize: 80 / 2.5,
                                    icon: Icon(
                                      isScrapped
                                          ? CupertinoIcons.bookmark_solid
                                          : CupertinoIcons.bookmark,
                                      color: Color(0xffFFBC0E),
                                    ),
                                    onPressed: () {
                                      // todo : scrap 로직 구현
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ), //뒤로가기, 북마크 아이콘
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 78 / 2.5),
                            Text(
                              post_title,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xffFFBC0E),
                                fontSize: 56 / 2.5,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.bold,
                              ),
                            ), // 제목
                            const SizedBox(height: 30 / 2.5),
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
                                      style: const TextStyle(
                                          color: Color(0xff494949),
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32 / 2.5),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16 / 2.5),
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
                                      style: const TextStyle(
                                          color: Color(0xff494949),
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32 / 2.5),
                                    ),
                                  ),
                                ),
                              ],
                            ), // 태그
                            const SizedBox(height: 55 / 2.5),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40 / 2.5),
                              child: Image.network(
                                post_image,
                                height: 720 / 2.5,
                                width: 960 / 2.5,
                                fit: BoxFit.cover,
                              ),
                            ), // 이미지
                            const SizedBox(height: 90 / 2.5),
                            ListView.builder(
                              itemCount: workpostcontroller
                                      .Works.value.data?.postParagraph ??
                                  1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final paragraphTitle = workpostcontroller
                                        .Works
                                        .value
                                        .data
                                        ?.postText?[index]
                                        .paragraphTitle ??
                                    'error !!';
                                final paragraphContents = workpostcontroller
                                        .Works
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
                                            style: const TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36 / 2.5,
                                              color: Color(0xff1F1F1F),
                                            ),
                                          ),
                                          TextSpan(
                                            text: paragraphContents,
                                            style: const TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 36 / 2.5,
                                              color: Color(0xff494949),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 90 / 2.5)
                                  ],
                                );
                              },
                            ), // 내용
                          ],
                        ),
                      ),
                      const SizedBox(height: 90 / 2.5),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100 / 2.5,
                  width: 432,
                  color: Color(0xffFFDF6C),
                  child: const Text(
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

void cardpost_modal(BuildContext context, String post_title, String tag1,
    String tag2, String post_image, Future<bool> scrapStatus) async {
  final CardPostModalController cardpostcontroller =
  Get.put(CardPostModalController());

  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
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
                            icon: const Icon(
                              CupertinoIcons.back,
                              size: 80 / 2.5,
                              color: Color(0xffFFBC0E),
                            ),
                          ),
                          FutureBuilder<bool>(
                            future: scrapStatus,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // 데이터 로딩 중
                                return CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                print('Error: ${snapshot.error}');
                                // 에러 처리
                                return Text('error');
                              }
                              bool isScrapped = snapshot.data ?? false;
                              return Row(
                                children: [
                                  const SizedBox(width: 177),
                                  IconButton(
                                    iconSize: 80 / 2.5,
                                    icon: Icon(
                                      isScrapped
                                          ? CupertinoIcons.bookmark_solid
                                          : CupertinoIcons.bookmark,
                                      color: Color(0xffFFBC0E),
                                    ),
                                    onPressed: () {
                                      // todo : scrap 로직 구현
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ), //뒤로가기, 북마크 아이콘
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 78 / 2.5),
                            Text(
                              post_title,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xffFFBC0E),
                                fontSize: 56 / 2.5,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.bold,
                              ),
                            ), // 제목
                            const SizedBox(height: 30 / 2.5),
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
                                      style: const TextStyle(
                                          color: Color(0xff494949),
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32 / 2.5),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16 / 2.5),
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
                                      style: const TextStyle(
                                          color: Color(0xff494949),
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32 / 2.5),
                                    ),
                                  ),
                                ),
                              ],
                            ), // 태그
                            const SizedBox(height: 55 / 2.5),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40 / 2.5),
                              child: Image.network(
                                post_image,
                                height: 720 / 2.5,
                                width: 960 / 2.5,
                                fit: BoxFit.cover,
                              ),
                            ), // 이미지
                            const SizedBox(height: 90 / 2.5),
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
                                            style: const TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36 / 2.5,
                                              color: Color(0xff1F1F1F),
                                            ),
                                          ),
                                          TextSpan(
                                            text: paragraphContents,
                                            style: const TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 36 / 2.5,
                                              color: Color(0xff494949),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 90 / 2.5)
                                  ],
                                );
                              },
                            ), // 내용
                          ],
                        ),
                      ),
                      const SizedBox(height: 90 / 2.5),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100 / 2.5,
                  width: 432,
                  color: Color(0xffFFDF6C),
                  child: const Text(
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