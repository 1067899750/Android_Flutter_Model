import 'package:app_flutter/utils/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';

///
/// 生命周期监听
///
class AppGlobalPageVisibilityObserver extends GlobalPageVisibilityObserver {
  String TAG = 'AppGlobalPageVisibilityObserver';

  @override
  void onPagePush(Route<dynamic> route) {
    Log.info(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageCreate route:${route.settings.name}',
        tag: TAG);
  }

  @override
  void onPageShow(Route<dynamic> route) {
    Log.info(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageShow route:${route.settings.name}',
        tag: TAG);
  }

  @override
  void onPageHide(Route<dynamic> route) {
    Log.info(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageHide route:${route.settings.name}',
        tag: TAG);
  }

  @override
  void onPagePop(Route<dynamic> route) {
    Log.info(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageDestroy route:${route.settings.name}',
        tag: TAG);
  }

  @override
  void onForeground(Route route) {
    Log.info(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onForeground route:${route.settings.name}',
        tag: TAG);
  }

  @override
  void onBackground(Route<dynamic> route) {
    Log.info(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onBackground route:${route.settings.name}',
        tag: TAG);
  }
}
