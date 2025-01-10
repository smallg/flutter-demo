import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'route/route_utils.dart';
import 'route/routes.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  final logicalLongestSide =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  const scaleFactor = 0.95;
  return Size(
      logicalShortestSide * scaleFactor, logicalLongestSide * scaleFactor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: designSize,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            ),
            navigatorKey: RouteUtils.navigatorKey,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: RoutePath.home,
          );
        },
      ),
    );
  }
}
