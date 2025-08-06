package com.example.androidflutter;

import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.FlutterBoostRouteOptions;

import java.util.HashMap;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);


    }

    public void onViewClick(View view) {
        FlutterBoostRouteOptions options = new FlutterBoostRouteOptions.Builder()
                .pageName("mainPage")
                .arguments(new HashMap<>())
                .requestCode(1111)
                .build();
        FlutterBoost.instance().open(options);
    }
}
