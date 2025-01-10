import 'package:flutter/material.dart';
import '../../repository/api.dart';
import '../../repository/datas/home_banner_data.dart';
import '../../repository/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerData?>? bannerList;
  List<HomeListItemData>? listData = [];

  Future getBanner() async {
    List<HomeBannerData?>? list = await Api.instance.getBanner();
    bannerList = list ?? [];
    notifyListeners();
  }

  Future getHomeList() async {
    List<HomeListItemData>? list = await Api.instance.getHomeList();
    listData?.addAll(list ?? []);
    notifyListeners();
  }

  Future getTopList() async {
    List<HomeListItemData>? list = await Api.instance.getHomeTopList();
    listData?.clear();
    listData?.addAll(list ?? []);
  }

  Future initListData() async {
    await getTopList();
    await getHomeList();
  }
}
