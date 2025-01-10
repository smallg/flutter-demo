import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_ui/navigation/navigation_bar_widget.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/hot_key/hot_key_page.dart';
import 'package:flutter_application_1/pages/knowledge/knowledge_page.dart';
import 'package:flutter_application_1/pages/personal/personal_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  int currentIndex = 0;
  late List<Widget> pages;
  late List<String> labels;
  late List<String> icons;
  late List<String> activeIcons;
  void initTabData() {
    pages = [HomePage(), HotKeyPage(), KnowledgePage(), PersonalPage()];
    labels = ['首页', '热点', '体系', '我的'];
    icons = [
      'assets/images/icon_home_grey.png',
      'assets/images/icon_hot_key_grey.png',
      'assets/images/icon_knowledge_grey.png',
      'assets/images/icon_personal_grey.png',
    ];
    activeIcons = [
      'assets/images/icon_home_selected.png',
      'assets/images/icon_hot_key_selected.png',
      'assets/images/icon_knowledge_selected.png',
      'assets/images/icon_personal_selected.png',
    ];
  }

  @override
  void initState() {
    super.initState();
    initTabData();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWidget(
      pages: pages,
      labels: labels,
      icons: icons,
      activeIcons: activeIcons,
      onTabChange: (index) {},
    );
  }
}
