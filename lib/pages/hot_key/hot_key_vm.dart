import 'package:flutter/material.dart';
import '../../repository/api.dart';
import '../../repository/datas/common_website_data.dart';
import '../../repository/datas/search_hot_keys_data.dart';

class HotKeyViewModel with ChangeNotifier {
  List<CommonWebsiteModel>? websiteList;
  List<SearchHotKeyModel>? keyList;

  Future initData() async {
    getWebsiteList().then((value) {
      getSearchHotKeys().then((value) {
        notifyListeners();
      });
    });
  }

  Future getWebsiteList() async {
    websiteList = await Api.instance.getWebsiteList();
  }

  Future getSearchHotKeys() async {
    keyList = await Api.instance.getSearchHotKeys();
  }
}
