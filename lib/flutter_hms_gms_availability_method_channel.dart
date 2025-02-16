import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_hms_gms_availability_platform_interface.dart';

/// An implementation of [FlutterHmsGmsAvailabilityPlatform] that uses method channels.
class MethodChannelFlutterHmsGmsAvailability extends FlutterHmsGmsAvailabilityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_hms_gms_availability');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
