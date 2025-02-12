import 'package:dio/dio.dart';

import '../http/dio_instance.dart';
import 'datas/common_website_data.dart';
import 'datas/home_banner_data.dart';
import 'datas/home_list_data.dart';
import 'datas/knowledge_detail_list_model.dart';
import 'datas/knowledge_list_model.dart';
import 'datas/search_hot_keys_data.dart';
import 'datas/user_info_model.dart';

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

  Future<dynamic> register({String? name, String? pwd, String? rePwd}) async {
    Response response = await DioInstance.instance().post(
        path: 'user/register',
        queryParameters: {
          'username': name,
          'password': pwd,
          'repassword': rePwd
        });
    return response.data;
  }

  Future<UserInfoModel> login({String? name, String? pwd}) async {
    Response response =
        await DioInstance.instance().post(path: 'user/login', queryParameters: {
      'username': name,
      'password': pwd,
    });
    return UserInfoModel.fromJson(response.data);
  }

  Future<List<KnowledgeModel?>?> knowledgeList() async {
    Response response = await DioInstance.instance().get(path: "tree/json");
    var model = KnowledgeListModel.fromJson(response.data);
    return model.list;
  }

  Future<List<KnowledgeDetailItem>?> knowledgeDetailList(
      String id, String pageCount) async {
    Response response = await DioInstance.instance()
        .get(path: "article/list/$pageCount/json", param: {"cid": id});
    var model = KnowledgeDetailListModel.fromJson(response.data);
    return model.datas;
  }

  Future<bool?> collect(String? id) async {
    Response response =
        await DioInstance.instance().post(path: 'lg/collect/$id/json');
    if (response.data != null && response.data is bool) {
      return response.data;
    }
    return false;
  }

  Future<bool?> unCollect(String? id) async {
    Response response =
        await DioInstance.instance().post(path: 'lg/uncollect_originId/$id/json');
    if (response.data != null && response.data is bool) {
      return response.data;
    }
    return false;
  }
}
