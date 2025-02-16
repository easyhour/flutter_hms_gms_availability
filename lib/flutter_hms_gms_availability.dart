import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHmsGmsAvailability {
  static const MethodChannel _channel = MethodChannel(
    'flutter_hms_gms_availability',
  );

  static Future<bool> get isHmsAvailable async {
    return await _channel.invokeMethod('isHmsAvailable');
  }

  static Future<bool> get isGmsAvailable async {
    return await _channel.invokeMethod('isGmsAvailable');
  }
}
