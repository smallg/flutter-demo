import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/hot_key/hot_key_vm.dart';
import 'package:flutter_application_1/pages/search/search_page.dart';
import 'package:flutter_application_1/pages/web_view_page.dart';
import 'package:flutter_application_1/route/route_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../repository/datas/common_website_data.dart';
import '../../repository/datas/search_hot_keys_data.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HotKeyPageState();
  }
}

class _HotKeyPageState extends State<HotKeyPage> {
  HotKeyViewModel viewModel = HotKeyViewModel();

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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 0.5.r, color: Colors.grey),
                        bottom: BorderSide(width: 0.5.r, color: Colors.grey),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      children: [
                        Text(
                          '搜索热词',
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () {
                            RouteUtils.push(context, const SearchPage());
                          },
                          child: Image.asset(
                            'assets/images/icon_search.png',
                            width: 30.r,
                            height: 30.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<HotKeyViewModel>(builder: (context, vm, child) {
                    return _gridView(false, keyList: vm.keyList,
                        itemTap: (value) {
                      RouteUtils.push(context, SearchPage(keyword: value));
                    });
                  }),
                  Container(
                    height: 45.h,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 0.5.r, color: Colors.grey),
                        bottom: BorderSide(width: 0.5.r, color: Colors.grey),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Text(
                      '常用网站',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ),
                  Consumer<HotKeyViewModel>(builder: (context, vm, child) {
                    return _gridView(true, websiteList: vm.websiteList,
                        itemTap: (value) {
                      RouteUtils.push(
                          context, WebViewPage(title: '常用网站', url: value));
                    });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridView(
    bool? isWebsite, {
    List<CommonWebsiteModel>? websiteList,
    List<SearchHotKeyModel>? keyList,
    ValueChanged<String>? itemTap,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 8.r,
          crossAxisSpacing: 8.r,
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 3.0,
        ),
        itemBuilder: (context, index) {
          if (isWebsite == true) {
            return _item(
                name: websiteList?[index].name,
                itemTap: itemTap,
                link: websiteList?[index].link);
          } else {
            return _item(name: keyList?[index].name, itemTap: itemTap);
          }
        },
        itemCount:
            isWebsite == true ? websiteList?.length ?? 0 : keyList?.length ?? 0,
      ),
    );
  }

  Widget _item({String? name, ValueChanged<String>? itemTap, String? link}) {
    return GestureDetector(
      onTap: () {
        if (link != null) {
          itemTap?.call(link);
        } else {
          itemTap?.call(name ?? '');
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5.r),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Text(name ?? ''),
      ),
    );
  }
}
