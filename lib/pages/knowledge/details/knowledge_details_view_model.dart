import 'package:flutter/material.dart';
import '../../../common_ui/loading.dart';
import '../../../repository/api.dart';
import '../../../repository/datas/knowledge_detail_list_model.dart';
import '../../../repository/datas/knowledge_detail_param.dart';

class KnowledgeDetailsViewModel with ChangeNotifier {
  List<Tab> tabList = [];
  List<KnowledgeDetailItem> detailList = [];
  int _pageCount = 0;

  void initTabs(List<KnowledgeDetailParam>? params) {
    if (params?.isNotEmpty == true) {
      params?.forEach((item) {
        tabList.add(Tab(text: item.name ?? ""));
      });
    }
  }

  Future getDetailList(String? id, bool loadMore) async {
    Loading.showLoading();
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      detailList.clear();
    }
    var list = await Api.instance.knowledgeDetailList(id ?? "", "$_pageCount");
    if (list?.isNotEmpty == true) {
      detailList.addAll(list ?? []);
      notifyListeners();
    } else {
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
    Loading.dismissAll();
  }
}
