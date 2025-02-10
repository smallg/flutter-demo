
class HomeBannerListData{
  List<HomeBannerData?>? bannerList;
  HomeBannerListData.fromJson(dynamic json) {
    if (json is List){
      bannerList = [];
      for (var element in json) {
        bannerList?.add(HomeBannerData.fromJson(element));
      }
    }
  }
}

class HomeBannerData {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  HomeBannerData({this.desc, this.id, this.imagePath, this.isVisible, this.order, this.title, this.type, this.url});

  HomeBannerData.fromJson(Map<String, dynamic> json) {
    if(json["desc"] is String) {
      desc = json["desc"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["imagePath"] is String) {
      imagePath = json["imagePath"];
    }
    if(json["isVisible"] is int) {
      isVisible = json["isVisible"];
    }
    if(json["order"] is int) {
      order = json["order"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["type"] is int) {
      type = json["type"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  static List<HomeBannerData> fromList(List<Map<String, dynamic>> list) {
    return list.map(HomeBannerData.fromJson).toList();
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