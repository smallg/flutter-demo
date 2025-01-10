import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../datas/home_banner_data.dart';
import '../../datas/home_list_data.dart';
import '../../http/dio_instance.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerData?>? bannerList;
  List<HomeListItemData>? listData;

  Future getBanner() async {
    Response response = await DioInstance.instance().get(path: 'banner/json');
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    if (bannerData.bannerList != null) {
      bannerList = bannerData.bannerList;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  Future getHomeList() async {
    Response response =
        await DioInstance.instance().get(path: 'article/list/1/json');
    HomeListData homeData = HomeListData.fromJson(response.data);
    if (homeData.datas?.isNotEmpty == true) {
      listData = homeData.datas;
    } else {
      listData = [];
    }
    notifyListeners();
  }
}
