import 'package:flutter/material.dart';
import '../../repository/api.dart';
import '../../repository/datas/home_banner_data.dart';
import '../../repository/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  int page = 1;
  List<HomeBannerData?>? bannerList;
  List<HomeListItemData>? listData = [];

  Future getBanner() async {
    List<HomeBannerData?>? list = await Api.instance.getBanner();
    bannerList = list ?? [];
    notifyListeners();
  }

  Future getHomeList(bool loadMore) async {
    List<HomeListItemData>? list = await Api.instance.getHomeList("$page");
    if (list != null && list.isNotEmpty) {
      return list;
    } else {
      if (loadMore && page > 0) {
        page--;
      }
      return [];
    }
  }

  Future<List<HomeListItemData>?> getTopList(bool loadMore) async {
    if (loadMore) {
      return [];
    }
    List<HomeListItemData>? list = await Api.instance.getHomeTopList();
    return list;
  }

  Future initListData(bool loadMore, {ValueChanged<bool>? callback}) async {
    if (loadMore) {
      page++;
    } else {
      page = 1;
      listData?.clear();
    }
    getTopList(loadMore).then((topList) {
      if (!loadMore) {
        listData?.addAll(topList ?? []);
      }
      getHomeList(loadMore).then((allList) {
        listData?.addAll(allList ?? []);
        notifyListeners();
        callback?.call(loadMore);
      });
    });
  }

  Future<dynamic> collect(String? id, int index) async {
    bool? result = await Api.instance.collect(id);
    if (result == true) {
      listData?[index].collect = true;
      notifyListeners();
    }
  }

  Future<dynamic> collectOrNot(bool isCollect, String? id, int index) async {
    bool? result;
    if (isCollect) {
      result = await Api.instance.collect(id);
    } else {
      result = await Api.instance.unCollect(id);
    }
    if (result == true) {
      listData?[index].collect = isCollect;
      notifyListeners();
    }
  }
}
