package com.example.androidflutter

import android.os.Bundle
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.containers.FlutterBoostActivity

class MyFlutterActivity: FlutterBoostActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        FlutterBoost.instance().plugin.onContainerCreated(this)
    }

    override fun onStart() {
        super.onStart()
        FlutterBoost.instance().plugin.onForeground()
    }

    override fun onResume() {
        super.onResume()
        FlutterBoost.instance().plugin.onBackPressed()
    }

    override fun onPause() {
        super.onPause()
    }

    override fun onStop() {
        super.onStop()
        FlutterBoost.instance().plugin.onContainerDisappeared(this)
    }

    override fun onDestroy() {
        super.onDestroy()
        FlutterBoost.instance().plugin.onContainerDestroyed(this)
    }

    override fun onBackPressed() {
        super.onBackPressed()
        FlutterBoost.instance().plugin.onBackPressed()
    }
}