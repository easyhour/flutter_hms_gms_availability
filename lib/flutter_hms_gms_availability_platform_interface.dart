import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_hms_gms_availability_method_channel.dart';

abstract class FlutterHmsGmsAvailabilityPlatform extends PlatformInterface {
  /// Constructs a FlutterHmsGmsAvailabilityPlatform.
  FlutterHmsGmsAvailabilityPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterHmsGmsAvailabilityPlatform _instance = MethodChannelFlutterHmsGmsAvailability();

  /// The default instance of [FlutterHmsGmsAvailabilityPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterHmsGmsAvailability].
  static FlutterHmsGmsAvailabilityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterHmsGmsAvailabilityPlatform] when
  /// they register themselves.
  static set instance(FlutterHmsGmsAvailabilityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
