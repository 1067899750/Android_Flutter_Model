import 'package:app_flutter/router/app_global_page_visibility_observer.dart';
import 'package:app_flutter/router/custom_interceptor.dart';
import 'package:app_flutter/router/nav_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  PageVisibilityBinding.instance
      .addGlobalObserver(AppGlobalPageVisibilityObserver());
  CustomFlutterBinding();
  runApp(const MyApp());
}

class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Route<dynamic>? routeFactory(
      RouteSettings settings, bool isContainerPage, String? uniqueId) {
    FlutterBoostRouteFactory? func = NavRouter.routerMap[settings.name!];
    if (func == null) {
      return null;
    }
    return func(settings, isContainerPage, uniqueId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory,
        // 如果自定了appBuilder，需要将传入的参数添加到widget层次结构中去，
        // 否则会导致FluttBoost初始化失败。
        appBuilder: (child) => MaterialApp(
              home: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // 点击空白隐藏系统软件盘
                  FocusScope.of(context).unfocus();
                },
                child: child,
              ),
              builder: EasyLoading.init(),
            ),
        interceptors: [CustomInterceptor()]);
  }
}
