import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../repository/datas/knowledge_detail_param.dart';
import 'detail_tab_child_page.dart';
import 'knowledge_details_view_model.dart';

class KnowledgeDetailsTabPage extends StatefulWidget {
  final List<KnowledgeDetailParam>? params;

  const KnowledgeDetailsTabPage({super.key, this.params});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeDetailsTabPageState();
  }
}

class _KnowledgeDetailsTabPageState extends State<KnowledgeDetailsTabPage>
    with SingleTickerProviderStateMixin {
  var model = KnowledgeDetailsViewModel();
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.params?.length ?? 0, vsync: this);
    model.initTabs(widget.params);
    log("KnowledgeDetailsPage params=${widget.params?.length}");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return model;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: TabBar(
            controller: controller,
            tabs: model.tabList,
            isScrollable: true,
            labelColor: Colors.deepOrange,
            indicatorColor: Colors.green,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: controller,
            children: children(),
          ),
        ),
      ),
    );
  }

  List<Widget> children() {
    return widget.params?.map((e) {
          return DetailTabChildPage(id: e.id);
        }).toList() ??
        [];
  }
}
