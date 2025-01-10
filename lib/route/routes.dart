import 'package:flutter/material.dart';

import '../pages/tab_page.dart';
import '../pages/web_view_page.dart';

class RoutePath {
  static const String tap = '/';
  static const String webViewPage = '/web_view_page';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tap:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(title: 'from home'), settings: settings);
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
