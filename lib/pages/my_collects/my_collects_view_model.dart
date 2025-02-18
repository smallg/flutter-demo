import 'dart:developer';

import 'package:flutter/material.dart';

import '../../repository/api.dart';
import '../../repository/datas/my_collects_model.dart';

class MyCollectsViewModel with ChangeNotifier {
  List<MyCollectItemModel>? dataList = [];
  int _pageCount = 0;

  Future getMyCollects(bool loadMore) async {
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      dataList?.clear();
    }
    var list = await Api.instance.getMyCollects("$_pageCount");
    if (list != null && list.isNotEmpty == true) {
      dataList?.addAll(list);
      notifyListeners();
    } else {
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
  }

  Future cancelCollect(int index, String? id) async {
    bool success = await Api.instance.cancelCollect(id ?? "");
    if (success) {
      try {
        dataList?.remove(dataList?[index]);
        notifyListeners();
      } catch (e) {
        log("cancelCollect error=$e");
      }
    }
  }
}
