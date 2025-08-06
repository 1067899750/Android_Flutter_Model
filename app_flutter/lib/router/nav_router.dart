import 'package:app_flutter/page/debug_page.dart';
import 'package:app_flutter/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class NavRouter {
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    '/': (settings, isContainerPage, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => const DebugPage());
    },
    'mainPage': (settings, isContainerPage, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => const MainPage());
    },
  };
}
