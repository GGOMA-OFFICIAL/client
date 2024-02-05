class PostModel {
  int? status;
  int? totaldatacount;
  List<Data>? data;

  PostModel({this.status, this.totaldatacount, this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totaldatacount = json['totaldatacount'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totaldatacount'] = this.totaldatacount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? postTitle;
  List<String>? postTag;
  String? postImage;

  Data({this.postTitle, this.postTag, this.postImage});

  Data.fromJson(Map<String, dynamic> json) {
    postTitle = json['post_title'];
    postTag = json['post_tag'].cast<String>();
    postImage = json['post_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_title'] = this.postTitle;
    data['post_tag'] = this.postTag;
    data['post_image'] = this.postImage;
    return data;
  }
}
