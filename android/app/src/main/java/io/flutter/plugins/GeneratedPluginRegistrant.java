package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin path_provider, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      com.babariviere.sms.SmsPlugin.registerWith(shimPluginRegistry.registrarFor("com.babariviere.sms.SmsPlugin"));
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin sms_maintained, com.babariviere.sms.SmsPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.tfliteflutter.tflite_flutter_plugin.TfliteFlutterPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin tflite_flutter, com.tfliteflutter.tflite_flutter_plugin.TfliteFlutterPlugin", e);
    }
  }
}
