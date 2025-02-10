import 'package:dio/dio.dart';

import '../http/dio_instance.dart';
import 'datas/common_website_data.dart';
import 'datas/home_banner_data.dart';
import 'datas/home_list_data.dart';
import 'datas/search_hot_keys_data.dart';

class Api {
  static Api instance = Api._();
  Api._();

  Future<List<HomeBannerData?>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: 'banner/json');
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    return bannerData.bannerList;
  }

  Future<List<HomeListItemData>?> getHomeList(String page) async {
    Response response =
        await DioInstance.instance().get(path: "article/list/$page/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  Future<List<HomeListItemData>?> getHomeTopList() async {
    Response response =
        await DioInstance.instance().get(path: 'article/top/json');
    HomeTopListData homeData = HomeTopListData.fromJson(response.data);
    return homeData.topList;
  }

  Future<List<CommonWebsiteModel>?> getWebsiteList() async {
    Response response = await DioInstance.instance().get(path: 'friend/json');
    CommonWebsiteListModel websiteListData =
        CommonWebsiteListModel.fromJson(response.data);
    return websiteListData.list;
  }

  Future<List<SearchHotKeyModel>?> getSearchHotKeys() async {
    Response response = await DioInstance.instance().get(path: 'hotkey/json');
    SearchHotKeyListModel hotKeysListData =
        SearchHotKeyListModel.fromJson(response.data);
    return hotKeysListData.list;
  }
}
