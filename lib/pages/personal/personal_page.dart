import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_us/about_us_page.dart';
import 'package:flutter_application_1/pages/auth/login_page.dart';
import 'package:flutter_application_1/pages/personal/person_vm.dart';
import 'package:flutter_application_1/route/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../route/routes.dart';
import '../my_collects/my_collects_page.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PersonalPageState();
  }
}

class _PersonalPageState extends State<PersonalPage> {
  PersonViewModel viewModel = PersonViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _header(() {
                if (viewModel.shouldLogin == true) {
                  RouteUtils.push(context, LoginPage());
                }
              }),
              _settingItem('我的收藏', () {
                if (viewModel.shouldLogin == true) {
                  RouteUtils.push(context, const LoginPage());
                } else {
                  RouteUtils.pushForNamed(context, RoutePath.my_collects);
                }
              }),
              _settingItem('检查更新', () {}),
              _settingItem('关于我们', () {
                RouteUtils.push(context, AboutUsPage());
              }),
              Consumer<PersonViewModel>(builder: (context, vm, child) {
                if (vm.shouldLogin) {
                  return SizedBox();
                }
                return _settingItem('退出登录', () {
                  viewModel.logout((value) {
                    if (value == true) {
                      RouteUtils.pushAndRemoveUntil(context, LoginPage());
                    } else {
                      showToast("退出失败");
                    }
                  });
                });
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingItem(String? title, GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5.r),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: TextStyle(color: Colors.black, fontSize: 13.sp),
            ),
            Image.asset(
              'assets/images/img_arrow_right.png',
              width: 20.r,
              height: 20.r,
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(GestureTapCallback? onTap) {
    return Container(
      alignment: Alignment.center,
      color: Colors.teal,
      width: double.infinity,
      height: 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(35.r)),
              child: Image.asset(
                'assets/images/logo.png',
                width: 70.r,
                height: 70.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Consumer<PersonViewModel>(builder: (context, vm, child) {
            return GestureDetector(
              onTap: onTap,
              child: Text(
                vm.username ?? '123',
                style: TextStyle(color: Colors.white, fontSize: 13.sp),
              ),
            );
          }),
        ],
      ),
    );
  }
}
