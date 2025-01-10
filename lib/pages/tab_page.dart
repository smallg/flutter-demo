import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [
            HomePage(),
            HotKeyPage(),
            KnowledgePage(),
            PersonalPage(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          items: _barItemList(),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _barItemList() {
    List<BottomNavigationBarItem> items = [];
    items.add(
      BottomNavigationBarItem(
        label: '首页',
        icon: Image.asset(
          'assets/images/icon_home_grey.png',
          width: 32.r,
          height: 32.r,
        ),
        activeIcon: Image.asset(
          'assets/images/icon_home_selected.png',
          width: 32.r,
          height: 32.r,
        ),
      ),
    );
    items.add(
      BottomNavigationBarItem(
        label: '热点',
        icon: Image.asset(
          'assets/images/icon_hot_key_grey.png',
          width: 32.r,
          height: 32.r,
        ),
        activeIcon: Image.asset(
          'assets/images/icon_hot_key_selected.png',
          width: 32.r,
          height: 32.r,
        ),
      ),
    );
    items.add(
      BottomNavigationBarItem(
        label: '体系',
        icon: Image.asset(
          'assets/images/icon_knowledge_grey.png',
          width: 32.r,
          height: 32.r,
        ),
        activeIcon: Image.asset(
          'assets/images/icon_knowledge_selected.png',
          width: 32.r,
          height: 32.r,
        ),
      ),
    );
    items.add(
      BottomNavigationBarItem(
        label: '我的',
        icon: Image.asset(
          'assets/images/icon_personal_grey.png',
          width: 32.r,
          height: 32.r,
        ),
        activeIcon: Image.asset(
          'assets/images/icon_personal_selected.png',
          width: 32.r,
          height: 32.r,
        ),
      ),
    );
    return items;
  }
}
