
import 'flutter_hms_gms_availability_platform_interface.dart';

class FlutterHmsGmsAvailability {
  Future<String?> getPlatformVersion() {
    return FlutterHmsGmsAvailabilityPlatform.instance.getPlatformVersion();
  }
}
