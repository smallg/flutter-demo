import 'package:flutter/material.dart';
import 'package:flutter_application_1/route/route_utils.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _listItemView();
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.network(
            "https://picsum.photos/350/150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        autoplay: true,
      ),
    );
  }

  Widget _listItemView() {
    // or use GestureDetector
    return InkWell(
        onTap: () {
          RouteUtils.pushForNamed(context, RoutePath.webViewPage, arguments: {
            'name': 'test1',
          });
          // RouteUtils.pushForNamed(context, RoutePath.webViewPage);
          // Navigator.pushNamed(context, RoutePath.webViewPage);
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return WebViewPage(title: 'from home');
          // }));
        },
        child: Container(
          margin:
              EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
          padding:
              EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.5.r),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      "https://picsum.photos/100/100",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '作者',
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    '2025-01-09 10:00',
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10.w)),
                  Text('置顶',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                '泰国今年开放菠菜拍照了，招这些人应该是过去做菠菜的。',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '分类',
                    style: TextStyle(color: Colors.green, fontSize: 12.sp),
                  ),
                  Expanded(child: SizedBox()),
                  Image.asset('assets/images/img_collect_grey.png',
                      width: 30, height: 30),
                ],
              )
            ],
          ),
        ));
  }
}
