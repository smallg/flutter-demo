import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common_ui/loading.dart';
import '../../common_ui/smart_refresh/smart_refresh_widget.dart';
import '../../repository/datas/home_list_data.dart';
import '../../route/route_utils.dart';
import '../../route/routes.dart';
import 'home_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    Loading.showLoading();
    viewModel.getBanner();
    viewModel.initListData(false);
  }

  void refreshOrLoad(bool loadMore) {
    viewModel.initListData(loadMore, callback: (loadMore) {
      if (loadMore) {
        refreshController.loadComplete();
      } else {
        refreshController.refreshCompleted();
      }
      Loading.dismissAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: SmartRefreshWidget(
            controller: refreshController,
            onLoading: () {
              refreshOrLoad(true);
            },
            onRefresh: () {
              viewModel.getBanner().then((value) {
                refreshOrLoad(false);
              });
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _banner(),
                  _homeListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeListView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _listItemView(vm.listData?[index], index);
        },
        itemCount: vm.listData?.length ?? 0,
      );
    });
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        width: double.infinity,
        height: 180,
        child: Swiper(
          itemBuilder: (context, index) {
            return Container(
              height: 150.h,
              color: Colors.lightBlue,
              child: Image.network(
                vm.bannerList?[index]?.imagePath ?? '',
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: vm.bannerList?.length ?? 0,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          autoplay: true,
        ),
      );
    });
  }

  Widget _listItemView(HomeListItemData? item, int index) {
    String name;
    if (item?.author?.isNotEmpty == true) {
      name = item?.author ?? '';
    } else {
      name = item?.shareUser ?? '';
    }
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
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        padding:
            EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5.r),
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  name,
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(child: SizedBox()),
                Text(
                  item?.niceShareDate ?? '',
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                ),
                Padding(padding: EdgeInsets.only(right: 10.w)),
                item?.type?.toInt() == 1
                    ? Text('置顶',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold))
                    : SizedBox(),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              item?.title ?? '',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item?.chapterName ?? '',
                  style: TextStyle(color: Colors.green, fontSize: 12.sp),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    bool isCollect;
                    if (item?.collect == true) {
                      isCollect = false;
                    } else {
                      isCollect = true;
                    }
                    viewModel.collectOrNot(isCollect, "${item?.id}", index);
                  },
                  child: Image.asset(
                    item?.collect == true
                        ? 'assets/images/img_collect.png'
                        : 'assets/images/img_collect_grey.png',
                    width: 30,
                    height: 30,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
