import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/utils/sp_utils.dart';
import 'package:oktoast/oktoast.dart';

import '../../repository/api.dart';
import '../../repository/datas/user_info_model.dart';

class AuthViewModel with ChangeNotifier {
  RegisterInfo registerInfo = RegisterInfo();
  LoginInfo loginInfo = LoginInfo();

  Future<bool?> register() async {
    if (registerInfo.name != null &&
        registerInfo.pwd != null &&
        registerInfo.rePwd != null &&
        registerInfo.pwd == registerInfo.rePwd) {
      if ((registerInfo.pwd?.length ?? 0) >= 6) {
        dynamic result = await Api.instance.register(
          name: registerInfo.name,
          pwd: registerInfo.pwd,
          rePwd: registerInfo.rePwd,
        );
        if (result is bool) {
          return result;
        } else {
          return true;
        }
      }
      showToast('密码长度必须大于6位');
      return false;
    }
    showToast('输入不能为空或密码必须一致');
    return false;
  }

  Future<bool?> login() async {
    if (loginInfo.name != null && loginInfo.pwd != null) {
      UserInfoModel data = await Api.instance.login(
        name: loginInfo.name,
        pwd: loginInfo.pwd,
      );
      if (data.username != null && data.username?.isNotEmpty == true) {
        SpUtils.saveString(Constants.SP_USER_NAME, data.username ?? '');
        return true;
      }
      showToast('登录失败');
      return false;
    }
    showToast('输入不能为空');
    return false;
  }

  void setLoginInfo({String? username, String? pwd}) {
    if (username != null) {
      loginInfo.name = username;
    }
    if (pwd != null) {
      loginInfo.pwd = pwd;
    }
  }
}

class RegisterInfo {
  String? name;
  String? pwd;
  String? rePwd;
}

class LoginInfo {
  String? name;
  String? pwd;
}
