class WorkPostModalModel {
  int? status;
  Data? data;

  WorkPostModalModel({this.status, this.data});

  WorkPostModalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? postId;
  String? postTitle;
  int? postParagraph;
  List<PostText>? postText;

  Data({this.postId, this.postTitle, this.postParagraph, this.postText});

  Data.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postTitle = json['post_title'];
    postParagraph = json['post_paragraph'];
    if (json['post_text'] != null) {
      postText = <PostText>[];
      json['post_text'].forEach((v) {
        postText!.add(new PostText.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['post_title'] = this.postTitle;
    data['post_paragraph'] = this.postParagraph;
    if (this.postText != null) {
      data['post_text'] = this.postText!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostText {
  String? paragraphTitle;
  String? paragraphContents;

  PostText({this.paragraphTitle, this.paragraphContents});

  PostText.fromJson(Map<String, dynamic> json) {
    paragraphTitle = json['paragraph_title'];
    paragraphContents = json['paragraph_contents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paragraph_title'] = this.paragraphTitle;
    data['paragraph_contents'] = this.paragraphContents;
    return data;
  }
}
