import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../model/scrap_model.dart';
import 'CardPostView.dart';
import 'PostModal.dart';

class WorkPost extends StatefulWidget {
  final Data? data;
  final Future<bool>? scrap;

  const WorkPost({super.key, required this.data, this.scrap});

  @override
  State<WorkPost> createState() => _WorkPostState();
}

class _WorkPostState extends State<WorkPost> {
  late Future<bool> scrapStatus;

  @override
  void initState() {
    super.initState();
    // 초기 스크랩 상태를 설정합니다.
    if (widget.scrap != null) {
      scrapStatus = widget.scrap!;
    } else {
      // 여기서 false를 기본값으로 설정했습니다.
      // 필요에 따라 다른 로직을 추가할 수 있습니다.
      scrapStatus = Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        workpost_modal(context, widget.data!.postTitle!,
            widget.data!.postTag!.first,widget.data!.postTag!.last,
            widget.data!.postImage!,scrapStatus);
    },
      child: Container(
        width: 960 / 2.5,
        height: 324 / 2.5,
        decoration: BoxDecoration(
          color: Color(0xffFFF4CB),
          borderRadius: BorderRadius.circular(24 / 2.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24 / 2.5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16 / 2.5),
                child: Image.network(
                  widget.data!.postImage!,
                  width: 309.33 / 2.5,
                  height: 276 / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 40 / 2.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(
                      widget.data!.postTitle!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xff494949),
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.bold,
                          fontSize: 42 / 2.5),
                    ),
                  ),
                  SizedBox(height: 20 / 2.5),
                  Row(
                    children: [
                      Container(
                        //tag1
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xffFFBC0E), width: 2.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8 / 2.5,
                            bottom: 8 / 2.5,
                            left: 24 / 2.5,
                            right: 24 / 2.5,
                          ),
                          child: Text(
                            widget.data!.postTag!.first,
                            style: TextStyle(
                                color: Color(0xffFFBC0E),
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
                            border:
                                Border.all(color: Color(0xffFFBC0E), width: 2.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8 / 2.5,
                            bottom: 8 / 2.5,
                            left: 24 / 2.5,
                            right: 24 / 2.5,
                          ),
                          child: Text(
                            widget.data!.postTag!.last,
                            style: TextStyle(
                                color: Color(0xffFFBC0E),
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                fontSize: 32 / 2.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<bool>(
                    future: scrapStatus,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                          SizedBox(width: 177),
                          IconButton(
                            iconSize: 80 / 2.5,
                            icon: Icon(
                              isScrapped
                                  ? CupertinoIcons.bookmark_solid
                                  : CupertinoIcons.bookmark,
                              color: Color(0xffFFBC0E),
                            ),
                            onPressed: () {
                              setState(() {
                                // 스크랩 상태 토글
                                isScrapped = !isScrapped;
                                // TODO: 여기서 스크랩 상태 업데이트 로직을 추가하세요.
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



class CardPost extends StatefulWidget {
  final Data? data;
  final Future<bool>? scrap;

  const CardPost({super.key, required this.data, this.scrap});

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  late Future<bool> scrapStatus;

  @override
  void initState() {
    super.initState();
    // 초기 스크랩 상태를 설정합니다.
    if (widget.scrap != null) {
      scrapStatus = widget.scrap!;
    } else {
      // 여기서 false를 기본값으로 설정했습니다.
      // 필요에 따라 다른 로직을 추가할 수 있습니다.
      scrapStatus = Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        cardpost_modal(context, widget.data!.postTitle!,
            widget.data!.postTag!.first,widget.data!.postTag!.last,
            widget.data!.postImage!,scrapStatus);
      },
      child: Container(
        width: 960 / 2.5,
        height: 324 / 2.5,
        decoration: BoxDecoration(
          color: Color(0xffFFF4CB),
          borderRadius: BorderRadius.circular(24 / 2.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24 / 2.5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16 / 2.5),
                child: Image.network(
                  widget.data!.postImage!,
                  width: 309.33 / 2.5,
                  height: 276 / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 40 / 2.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(
                      widget.data!.postTitle!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xff494949),
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.bold,
                          fontSize: 42 / 2.5),
                    ),
                  ),
                  SizedBox(height: 20 / 2.5),
                  Row(
                    children: [
                      Container(
                        //tag1
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Color(0xffFFBC0E), width: 2.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8 / 2.5,
                            bottom: 8 / 2.5,
                            left: 24 / 2.5,
                            right: 24 / 2.5,
                          ),
                          child: Text(
                            widget.data!.postTag!.first,
                            style: TextStyle(
                                color: Color(0xffFFBC0E),
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
                            border:
                            Border.all(color: Color(0xffFFBC0E), width: 2.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8 / 2.5,
                            bottom: 8 / 2.5,
                            left: 24 / 2.5,
                            right: 24 / 2.5,
                          ),
                          child: Text(
                            widget.data!.postTag!.last,
                            style: TextStyle(
                                color: Color(0xffFFBC0E),
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                fontSize: 32 / 2.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<bool>(
                    future: scrapStatus,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                          SizedBox(width: 177),
                          IconButton(
                            iconSize: 80 / 2.5,
                            icon: Icon(
                              isScrapped
                                  ? CupertinoIcons.bookmark_solid
                                  : CupertinoIcons.bookmark,
                              color: Color(0xffFFBC0E),
                            ),
                            onPressed: () {
                              setState(() {
                                // 스크랩 상태 토글
                                isScrapped = !isScrapped;
                                // TODO: 여기서 스크랩 상태 업데이트 로직을 추가하세요.
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

