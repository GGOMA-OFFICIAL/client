class ScrapModel {
  int? totalscrap;
  ScrapStatus? scrapStatus;

  ScrapModel({this.totalscrap, this.scrapStatus});

  ScrapModel.fromJson(Map<String, dynamic> json) {
    totalscrap = json['totalscrap'];
    scrapStatus = json['scrapStatus'] != null
        ? new ScrapStatus.fromJson(json['scrapStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalscrap'] = this.totalscrap;
    if (this.scrapStatus != null) {
      data['scrapStatus'] = this.scrapStatus!.toJson();
    }
    return data;
  }
}

class ScrapStatus {
  Map<String, bool> posts = {};

  ScrapStatus.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      posts[key] = value;
    });
  }

  Map<String, dynamic> toJson() {
    return posts;
  }
}



