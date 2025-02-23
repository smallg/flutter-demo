import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_us/about_us_page.dart';

import '../pages/my_collects/my_collects_page.dart';
import '../pages/tab_page.dart';
import '../pages/web_view_page.dart';

class RoutePath {
  static const String tap = '/';
  static const String webViewPage = '/web_view_page';
  static const String loginPage = '/login_page';
  static const String registerPage = '/register_page';
  static const String searchPage = '/search_page';
  static const String my_collects = "/my_collects";
  static const String web_view = "/web_view";
  static const String about_us = "/about_us";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tap:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(title: 'from home'), settings: settings);
      case RoutePath.loginPage:
        return pageRoute(WebViewPage(title: 'from home'), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(WebViewPage(title: 'from home'), settings: settings);
      case RoutePath.searchPage:
        return pageRoute(WebViewPage(title: 'from home'), settings: settings);
      case RoutePath.my_collects:
        return pageRoute(const MyCollectsPage(), settings: settings);
      case RoutePath.about_us:
        return pageRoute(const AboutUsPage(), settings: settings);
    }
    return pageRoute(
      Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("route path ${settings.name} not found"),
          ),
        ),
      ),
    );
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: settings,
        maintainState: maintainState ?? true,
        fullscreenDialog: fullscreenDialog ?? false,
        allowSnapshotting: allowSnapshotting ?? true);
  }
}
