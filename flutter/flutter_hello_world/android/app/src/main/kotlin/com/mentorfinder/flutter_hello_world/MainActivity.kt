package com.mentorfinder.flutter_hello_world

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "dev.flutter.pigeon.flutter_hello_world.Api.search"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Api.setUp(flutterEngine.dartExecutor.binaryMessenger, MyApi())
    }



}
