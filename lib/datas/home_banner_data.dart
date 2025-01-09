class HomeBannerData {
  List<BannerItemData>? data;
  int? errorCode;
  String? errorMsg;

  HomeBannerData({this.data, this.errorCode, this.errorMsg});

  HomeBannerData.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => BannerItemData.fromJson(e)).toList();
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  static List<HomeBannerData> fromList(List<Map<String, dynamic>> list) {
    return list.map(HomeBannerData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["errorCode"] = errorCode;
    _data["errorMsg"] = errorMsg;
    return _data;
  }
}

class BannerItemData {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  BannerItemData(
      {this.desc,
      this.id,
      this.imagePath,
      this.isVisible,
      this.order,
      this.title,
      this.type,
      this.url});

  BannerItemData.fromJson(Map<String, dynamic> json) {
    desc = json["desc"];
    id = json["id"];
    imagePath = json["imagePath"];
    isVisible = json["isVisible"];
    order = json["order"];
    title = json["title"];
    type = json["type"];
    url = json["url"];
  }

  static List<BannerItemData> fromList(List<Map<String, dynamic>> list) {
    return list.map(BannerItemData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["desc"] = desc;
    _data["id"] = id;
    _data["imagePath"] = imagePath;
    _data["isVisible"] = isVisible;
    _data["order"] = order;
    _data["title"] = title;
    _data["type"] = type;
    _data["url"] = url;
    return _data;
  }
}
