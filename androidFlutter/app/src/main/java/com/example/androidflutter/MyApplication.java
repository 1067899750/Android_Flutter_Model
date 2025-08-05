package com.example.androidflutter;

import android.app.Application;
import android.content.pm.ApplicationInfo;

import com.example.androidflutter.router.MyFlutterBoostDelegate;
import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.FlutterBoostSetupOptions;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.FlutterEngine;


public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        //经过实验得出如下结论： pushNativeRoute 不是通过StartActivity过来的，而是从Flutter页面过来的
        //在Activity中通过 FlutterBoost.instance().open(options); 打开的页面是Flutter页面，不是原生界面


        ArrayList<String> args = new ArrayList<>();
        args.add("--trace-systrace");
        args.add("--user-authorization-code=QZvoUptODA+KDgeFUluhheYns7X7CnDu9YRv8YmU0GXQcKLzs4C2WgjblrAIhtkqqGg==");
        boolean isDebugMode = (getApplicationInfo().flags & ApplicationInfo.FLAG_DEBUGGABLE) != 0;
        List<String> entrypointArgs = new ArrayList<>();
        entrypointArgs.add("I am from Android!");
        entrypointArgs.add("--for-test");
        FlutterBoostSetupOptions options = new FlutterBoostSetupOptions.Builder()
                .dartEntrypointArgs(entrypointArgs)
                .isDebugLoggingEnabled(isDebugMode)
                .shellArgs(args.toArray(new String[0]))
                .build();
        // Register the platform view
        FlutterBoost.instance().setup(this, new MyFlutterBoostDelegate(), FlutterEngine::getPlugins, options);
    }

}
