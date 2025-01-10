import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'navigation_bar_item.dart';

class NavigationBarWidget extends StatefulWidget {
  NavigationBarWidget({
    super.key,
    required this.pages,
    required this.labels,
    required this.icons,
    required this.activeIcons,
    this.onTabChange,
    this.bottomBarIconWidth,
    this.bottomBarIconHeight,
    this.bottomNavigationBarType,
    this.themeData,
  }) {
    if (pages.length != labels.length &&
        pages.length != icons.length &&
        pages.length != activeIcons.length) {
      throw Exception("please check your config length");
    }
  }

  final List<Widget> pages;
  final List<String> labels;
  final List<String> icons;
  final List<String> activeIcons;
  final ValueChanged<int>? onTabChange;
  final double? bottomBarIconWidth;
  final double? bottomBarIconHeight;
  final BottomNavigationBarType? bottomNavigationBarType;
  final ThemeData? themeData;
  int? currentIndex = 0;

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarWidgetState();
  }
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: widget.currentIndex ?? 0,
          children: widget.pages,
        ),
      ),
      bottomNavigationBar: Theme(
        data: widget.themeData ??
            Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex ?? 0,
          items: _barItemList(),
          type: widget.bottomNavigationBarType ?? BottomNavigationBarType.fixed,
          onTap: (index) {
            if (widget.currentIndex == index) {
              return;
            }
            widget.currentIndex = index;
            widget.onTabChange?.call(index);
            setState(() {});
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _barItemList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < widget.pages.length; i++) {
      items.add(
        BottomNavigationBarItem(
          label: widget.labels[i],
          icon: Image.asset(
            widget.icons[i],
            width: widget.bottomBarIconWidth ?? 32.w,
            height: widget.bottomBarIconHeight ?? 32.w,
          ),
          activeIcon: NavigationBarItem(
            builder: (_) => Image.asset(
              widget.activeIcons[i],
              width: widget.bottomBarIconWidth ?? 32.w,
              height: widget.bottomBarIconHeight ?? 32.w,
            ),
          ),
        ),
      );
    }
    return items;
  }
}
