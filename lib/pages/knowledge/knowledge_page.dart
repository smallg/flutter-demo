import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common_ui/common_style.dart';
import '../../common_ui/smart_refresh/smart_refresh_widget.dart';
import '../../repository/datas/knowledge_list_model.dart';
import '../../route/route_utils.dart';
import 'details/knowledge_details_tab_page.dart';
import 'knowledge_view_model.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgePageState();
  }
}

class _KnowledgePageState extends State<KnowledgePage> {
  var model = KnowledgeViewModel();
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
    model.getKnowledgeList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return model;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SmartRefreshWidget(
            enablePullUp: false,
            onRefresh: () {
              model.getKnowledgeList().then((value) {
                _refreshController.refreshCompleted();
              });
            },
            controller: _refreshController,
            child: knowledgeListView(),
          ),
        ),
      ),
    );
  }

  Widget knowledgeListView() {
    return Consumer<KnowledgeViewModel>(builder: (context, value, child) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.list?.length ?? 0,
          itemBuilder: (context, index) {
            return knowledgeItem(value.list?[index]);
          });
    });
  }

  Widget knowledgeItem(KnowledgeModel? item) {
    return GestureDetector(
      onTap: () {
        RouteUtils.push(
          context,
          KnowledgeDetailsTabPage(
            params: model.generalParams(item?.children),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5.r),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.name ?? "",
                    style: titleTextStyle15,
                  ),
                  SizedBox(height: 10.h),
                  Text(model.generalChildNames(item?.children)),
                ],
              ),
            ),
            Image.asset(
              "assets/images/img_arrow_right.png",
              height: 24.r,
              width: 24.r,
            )
          ],
        ),
      ),
    );
  }
}
