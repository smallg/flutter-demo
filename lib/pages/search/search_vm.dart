import 'package:flutter/material.dart';
import '../../repository/api.dart';
import '../../repository/datas/search_data.dart';

class SearchViewModel with ChangeNotifier {
  List<SearchListData>? searchList;
  
  Future search(String? keyword) async {
    searchList = await Api.instance.searchList('1', keyword);
    notifyListeners();
  }

  void clear() {
    searchList?.clear();
    notifyListeners();
  }
}