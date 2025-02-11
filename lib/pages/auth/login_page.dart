import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/auth_vm.dart';
import 'package:flutter_application_1/pages/auth/register_page.dart';
import 'package:flutter_application_1/pages/tab_page.dart';
import 'package:flutter_application_1/route/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common_ui/common_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthViewModel viewModel = AuthViewModel();
  TextEditingController? usernameController;
  TextEditingController? pwdController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonInput(labelText: '输入账号', controller: usernameController),
                SizedBox(height: 20.h),
                commonInput(
                  labelText: '输入密码',
                  obscureText: true,
                  controller: pwdController,
                ),
                SizedBox(height: 50.h),
                whiteBorderButton(
                  title: '登录',
                  onTap: () {
                    viewModel.setLoginInfo(
                      username: usernameController?.text,
                      pwd: pwdController?.text,
                    );
                    viewModel.login().then((value) {
                      if (value == true) {
                        RouteUtils.pushAndRemoveUntil(context, TabPage());
                      }
                    });
                  },
                ),
                SizedBox(height: 5.h),
                registerButton(() {
                  RouteUtils.push(context, RegisterPage());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerButton(GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: 45.h,
        margin: EdgeInsets.only(left: 40.w, right: 40.w),
        child: Text(
          '注册',
          style: TextStyle(color: Colors.white, fontSize: 13.sp),
        ),
      ),
    );
  }
}
