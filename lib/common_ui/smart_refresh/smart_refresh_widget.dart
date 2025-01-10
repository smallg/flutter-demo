import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefreshWidget extends StatelessWidget {
  final bool? enablePullDown;
  final bool? enablePullUp;
  final Widget? header;
  final Widget? footer;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final RefreshController controller;
  final Widget child;

  const SmartRefreshWidget(
      {super.key,
      this.enablePullDown,
      this.enablePullUp,
      this.header,
      this.footer,
      this.onRefresh,
      this.onLoading,
      required this.controller,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return _refreshView();
  }

  Widget _refreshView() {
    return SmartRefresher(
      controller: controller,
      enablePullDown: enablePullDown ?? true,
      enablePullUp: enablePullUp ?? true,
      header: header ?? const ClassicHeader(),
      footer: footer ?? const ClassicFooter(),
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}
