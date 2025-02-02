import 'package:dio/dio.dart';

import '../http/dio_instance.dart';
import 'datas/home_banner_data.dart';
import 'datas/home_list_data.dart';

class Api {
  static Api instance = Api._();
  Api._();

  Future<List<HomeBannerData?>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: 'banner/json');
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    return bannerData.bannerList;
  }

  Future getHomeList(String page) async {
    Response response =
        await DioInstance.instance().get(path: "article/list/$page/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  Future getHomeTopList() async {
    Response response =
        await DioInstance.instance().get(path: 'article/top/json');
    HomeTopListData homeData = HomeTopListData.fromJson(response.data);
    return homeData.topList;
  }
}
