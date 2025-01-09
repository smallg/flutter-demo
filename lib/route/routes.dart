import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/web_view_page.dart';

class RoutePath {
  static const String home = '/';
  static const String webViewPage = '/web_view_page';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage());
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(title: 'from home'));
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
