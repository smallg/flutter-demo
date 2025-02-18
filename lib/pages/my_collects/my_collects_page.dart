import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common_ui/common_style.dart';
import '../../common_ui/smart_refresh/smart_refresh_widget.dart';
import '../../common_ui/web/webview_page.dart';
import '../../common_ui/web/webview_widget.dart';
import '../../repository/datas/my_collects_model.dart';
import '../../route/route_utils.dart';
import 'my_collects_view_model.dart';

class MyCollectsPage extends StatefulWidget {
  const MyCollectsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyCollectsPageState();
  }
}

class _MyCollectsPageState extends State<MyCollectsPage> {
  var model = MyCollectsViewModel();
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    refreshOrLoad(false);
  }

  void refreshOrLoad(bool loadMore) {
    model.getMyCollects(loadMore).then((value) {
      if (loadMore) {
        _refreshController.loadComplete();
      } else {
        _refreshController.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return model;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('我的收藏')),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Consumer<MyCollectsViewModel>(
            builder: (context, vm, child) {
              return SmartRefreshWidget(
                controller: _refreshController,
                onRefresh: () {
                  refreshOrLoad(false);
                },
                onLoading: () {
                  refreshOrLoad(true);
                },
                child: ListView.builder(
                  itemCount: vm.dataList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return _collectItem(
                      vm.dataList?[index],
                      onTap: () {
                        model.cancelCollect(index, "${vm.dataList?[index].id}");
                      },
                      itemClick: () {
                        RouteUtils.push(
                          context,
                          WebViewPage(
                            loadResource: vm.dataList?[index].link ?? "",
                            webViewType: WebViewType.URL,
                            showTitle: true,
                            title: vm.dataList?[index].title,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _collectItem(MyCollectItemModel? item,
      {GestureTapCallback? onTap, GestureTapCallback? itemClick}) {
    return GestureDetector(
      onTap: itemClick,
      child: Container(
        margin: EdgeInsets.all(10.r),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: Text("作者: ${item?.author}"),
              ),
              Text("时间: ${item?.niceDate}")
            ]),
            SizedBox(height: 6.h),
            Text("${item?.title}", style: titleTextStyle15),
            Row(
              children: [
                Expanded(child: Text("分类: ${item?.chapterName}")),
                collectImage(true, onTap: onTap)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
