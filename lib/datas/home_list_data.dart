
class HomeData {
  HomeListData? data;
  int? errorCode;
  String? errorMsg;

  HomeData({this.data, this.errorCode, this.errorMsg});

  HomeData.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : HomeListData.fromJson(json["data"]);
    }
    if(json["errorCode"] is int) {
      errorCode = json["errorCode"];
    }
    if(json["errorMsg"] is String) {
      errorMsg = json["errorMsg"];
    }
  }

  static List<HomeData> fromList(List<Map<String, dynamic>> list) {
    return list.map(HomeData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["errorCode"] = errorCode;
    _data["errorMsg"] = errorMsg;
    return _data;
  }
}

class HomeListData {
  int? curPage;
  List<HomeListItemData>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  HomeListData({this.curPage, this.datas, this.offset, this.over, this.pageCount, this.size, this.total});

  HomeListData.fromJson(Map<String, dynamic> json) {
    if(json["curPage"] is int) {
      curPage = json["curPage"];
    }
    if(json["datas"] is List) {
      datas = json["datas"] == null ? null : (json["datas"] as List).map((e) => HomeListItemData.fromJson(e)).toList();
    }
    if(json["offset"] is int) {
      offset = json["offset"];
    }
    if(json["over"] is bool) {
      over = json["over"];
    }
    if(json["pageCount"] is int) {
      pageCount = json["pageCount"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["total"] is int) {
      total = json["total"];
    }
  }

  static List<HomeListData> fromList(List<Map<String, dynamic>> list) {
    return list.map(HomeListData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["curPage"] = curPage;
    if(datas != null) {
      _data["datas"] = datas?.map((e) => e.toJson()).toList();
    }
    _data["offset"] = offset;
    _data["over"] = over;
    _data["pageCount"] = pageCount;
    _data["size"] = size;
    _data["total"] = total;
    return _data;
  }
}

class HomeListItemData {
  bool? adminAdd;
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<Tags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  HomeListItemData({this.adminAdd, this.apkLink, this.audit, this.author, this.canEdit, this.chapterId, this.chapterName, this.collect, this.courseId, this.desc, this.descMd, this.envelopePic, this.fresh, this.host, this.id, this.isAdminAdd, this.link, this.niceDate, this.niceShareDate, this.origin, this.prefix, this.projectLink, this.publishTime, this.realSuperChapterId, this.selfVisible, this.shareDate, this.shareUser, this.superChapterId, this.superChapterName, this.tags, this.title, this.type, this.userId, this.visible, this.zan});

  HomeListItemData.fromJson(Map<String, dynamic> json) {
    if(json["adminAdd"] is bool) {
      adminAdd = json["adminAdd"];
    }
    if(json["apkLink"] is String) {
      apkLink = json["apkLink"];
    }
    if(json["audit"] is int) {
      audit = json["audit"];
    }
    if(json["author"] is String) {
      author = json["author"];
    }
    if(json["canEdit"] is bool) {
      canEdit = json["canEdit"];
    }
    if(json["chapterId"] is int) {
      chapterId = json["chapterId"];
    }
    if(json["chapterName"] is String) {
      chapterName = json["chapterName"];
    }
    if(json["collect"] is bool) {
      collect = json["collect"];
    }
    if(json["courseId"] is int) {
      courseId = json["courseId"];
    }
    if(json["desc"] is String) {
      desc = json["desc"];
    }
    if(json["descMd"] is String) {
      descMd = json["descMd"];
    }
    if(json["envelopePic"] is String) {
      envelopePic = json["envelopePic"];
    }
    if(json["fresh"] is bool) {
      fresh = json["fresh"];
    }
    if(json["host"] is String) {
      host = json["host"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["isAdminAdd"] is bool) {
      isAdminAdd = json["isAdminAdd"];
    }
    if(json["link"] is String) {
      link = json["link"];
    }
    if(json["niceDate"] is String) {
      niceDate = json["niceDate"];
    }
    if(json["niceShareDate"] is String) {
      niceShareDate = json["niceShareDate"];
    }
    if(json["origin"] is String) {
      origin = json["origin"];
    }
    if(json["prefix"] is String) {
      prefix = json["prefix"];
    }
    if(json["projectLink"] is String) {
      projectLink = json["projectLink"];
    }
    if(json["publishTime"] is int) {
      publishTime = json["publishTime"];
    }
    if(json["realSuperChapterId"] is int) {
      realSuperChapterId = json["realSuperChapterId"];
    }
    if(json["selfVisible"] is int) {
      selfVisible = json["selfVisible"];
    }
    if(json["shareDate"] is int) {
      shareDate = json["shareDate"];
    }
    if(json["shareUser"] is String) {
      shareUser = json["shareUser"];
    }
    if(json["superChapterId"] is int) {
      superChapterId = json["superChapterId"];
    }
    if(json["superChapterName"] is String) {
      superChapterName = json["superChapterName"];
    }
    if(json["tags"] is List) {
      tags = json["tags"] == null ? null : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList();
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["type"] is int) {
      type = json["type"];
    }
    if(json["userId"] is int) {
      userId = json["userId"];
    }
    if(json["visible"] is int) {
      visible = json["visible"];
    }
    if(json["zan"] is int) {
      zan = json["zan"];
    }
  }

  static List<HomeListItemData> fromList(List<Map<String, dynamic>> list) {
    return list.map(HomeListItemData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["adminAdd"] = adminAdd;
    _data["apkLink"] = apkLink;
    _data["audit"] = audit;
    _data["author"] = author;
    _data["canEdit"] = canEdit;
    _data["chapterId"] = chapterId;
    _data["chapterName"] = chapterName;
    _data["collect"] = collect;
    _data["courseId"] = courseId;
    _data["desc"] = desc;
    _data["descMd"] = descMd;
    _data["envelopePic"] = envelopePic;
    _data["fresh"] = fresh;
    _data["host"] = host;
    _data["id"] = id;
    _data["isAdminAdd"] = isAdminAdd;
    _data["link"] = link;
    _data["niceDate"] = niceDate;
    _data["niceShareDate"] = niceShareDate;
    _data["origin"] = origin;
    _data["prefix"] = prefix;
    _data["projectLink"] = projectLink;
    _data["publishTime"] = publishTime;
    _data["realSuperChapterId"] = realSuperChapterId;
    _data["selfVisible"] = selfVisible;
    _data["shareDate"] = shareDate;
    _data["shareUser"] = shareUser;
    _data["superChapterId"] = superChapterId;
    _data["superChapterName"] = superChapterName;
    if(tags != null) {
      _data["tags"] = tags?.map((e) => e.toJson()).toList();
    }
    _data["title"] = title;
    _data["type"] = type;
    _data["userId"] = userId;
    _data["visible"] = visible;
    _data["zan"] = zan;
    return _data;
  }
}

class Tags {
  String? name;
  String? url;

  Tags({this.name, this.url});

  Tags.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  static List<Tags> fromList(List<Map<String, dynamic>> list) {
    return list.map(Tags.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["url"] = url;
    return _data;
  }
}