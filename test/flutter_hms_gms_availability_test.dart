import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability.dart';
import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability_platform_interface.dart';
import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterHmsGmsAvailabilityPlatform
    with MockPlatformInterfaceMixin
    implements FlutterHmsGmsAvailabilityPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterHmsGmsAvailabilityPlatform initialPlatform = FlutterHmsGmsAvailabilityPlatform.instance;

  test('$MethodChannelFlutterHmsGmsAvailability is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterHmsGmsAvailability>());
  });

  test('getPlatformVersion', () async {
    FlutterHmsGmsAvailability flutterHmsGmsAvailabilityPlugin = FlutterHmsGmsAvailability();
    MockFlutterHmsGmsAvailabilityPlatform fakePlatform = MockFlutterHmsGmsAvailabilityPlatform();
    FlutterHmsGmsAvailabilityPlatform.instance = fakePlatform;

    expect(await flutterHmsGmsAvailabilityPlugin.getPlatformVersion(), '42');
  });
}
