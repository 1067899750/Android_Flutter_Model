package com.example.androidflutter.router;

import android.content.Intent;
import android.widget.Toast;

import com.example.androidflutter.SimpleNativeActivity;
import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.FlutterBoostDelegate;
import com.idlefish.flutterboost.FlutterBoostRouteOptions;
import com.idlefish.flutterboost.containers.FlutterBoostActivity;

import io.flutter.embedding.android.FlutterActivityLaunchConfigs;

public class MyFlutterBoostDelegate implements FlutterBoostDelegate {

    @Override
    public void pushNativeRoute(FlutterBoostRouteOptions options) {
        System.out.println("pushNativeRoute " + options.pageName());
        //从 Flutter 打开Native 页面，具体打开哪个页面 是根据 options.pageName 来决定的
        //这里根据options.pageName来判断你想跳转哪个页面，这里简单给一个
        Intent intent = new Intent(FlutterBoost.instance().currentActivity(), SimpleNativeActivity.class);
        FlutterBoost.instance().currentActivity().startActivityForResult(intent, options.requestCode());
    }

    @Override
    public void pushFlutterRoute(FlutterBoostRouteOptions options) {
        System.out.println("pushFlutterRoute " + options.pageName());
        //打开Flutter 页面时调用到此处 1.Native 打开 Flutter 2. Flutter 打开 Flutter
        Intent intent = new FlutterBoostActivity.CachedEngineIntentBuilder(FlutterBoostActivity.class)
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .destroyEngineWithActivity(false)
                .uniqueId(options.uniqueId())
                .url(options.pageName())
                .urlParams(options.arguments())
                .build(FlutterBoost.instance().currentActivity());
        FlutterBoost.instance().currentActivity().startActivity(intent);
    }

    @Override
    public boolean popRoute(FlutterBoostRouteOptions options) {
        //自定义popRoute处理逻辑,如果不想走默认处理逻辑返回true进行拦截
        Toast.makeText(FlutterBoost.instance().currentActivity().getApplicationContext(), "Add customized popRoute handler here", Toast.LENGTH_SHORT).show();
        return false;
    }
}
