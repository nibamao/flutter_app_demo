import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdemo/constans/router.dart';
import 'package:flutterappdemo/index_page/page.dart';
import 'package:flutterappdemo/second_page/page.dart';

Widget createApp() {
  /**
   * 路由声明
   * 主框架及module入口路由
   */
  final AbstractRoutes routes = PageRoutes(pages: {
    RouterPath.main: IndexPage(),
    RouterPath.second: SecondPage(),
  });
  return MaterialApp(
    title: 'FishDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage(RouterPath.main, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
