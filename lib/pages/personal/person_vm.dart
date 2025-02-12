import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/utils/sp_utils.dart';

import '../../repository/api.dart';

class PersonViewModel with ChangeNotifier {
  String username = '';
  bool shouldLogin = false;

  Future initData() async {
    SpUtils.getString(Constants.SP_USER_NAME).then((value) {
      if (value == null || value == '') {
        username = '未登录';
        shouldLogin = true;
      } else {
        username = value;
        shouldLogin = false;
      }
      notifyListeners();
    });
  }

  Future logout(ValueChanged<bool> callback) async {
    bool? result = await Api.instance.logout();
    if (result == true) {
      SpUtils.removeAll();
      callback.call(true);
    } else {
      callback.call(false);
    }
  }
}
