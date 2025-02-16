package com.chimou.flutter_hms_gms_availability

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.content.Context
import com.huawei.hms.api.ConnectionResult
import com.huawei.hms.api.HuaweiApiAvailability
import com.google.android.gms.common.GoogleApiAvailability

/** FlutterHmsGmsAvailabilityPlugin */
class FlutterHmsGmsAvailabilityPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_hms_gms_availability")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "isHmsAvailable") {
            result.success(isHmsAvailable())
        } else if (call.method == "isGmsAvailable") {
            result.success(isGmsAvailable())
        } else {
            result.notImplemented()
        }
    }

    private fun isHmsAvailable(): Boolean {
        val result =
            context?.let { HuaweiApiAvailability.getInstance().isHuaweiMobileServicesAvailable(it) }
        val isAvailable = ConnectionResult.SUCCESS == result

        return isAvailable
    }

    private fun isGmsAvailable(): Boolean {
        val result: Int? =
            context?.let { GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(it) }
        val isAvailable = com.google.android.gms.common.ConnectionResult.SUCCESS === result

        return isAvailable
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
