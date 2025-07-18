import 'package:app_flutter/utils/log.dart';
import 'package:flutter_boost/flutter_boost.dart';


class CustomInterceptor extends BoostInterceptor {
  @override
  void onPrePush(
      BoostInterceptorOption option, PushInterceptorHandler handler) {
    Log.info('CustomInterceptor#onPrePush1~~~, $option',
        tag: 'CustomInterceptor');
    // Add extra arguments
    option.arguments!['CustomInterceptor1'] = "1";
    super.onPrePush(option, handler);
  }

  @override
  void onPostPush(
      BoostInterceptorOption option, PushInterceptorHandler handler) {
    Log.info('CustomInterceptor#onPostPush1~~~, $option',
        tag: 'CustomInterceptor');
    handler.next(option);
  }
}
