
import 'linkos_sdk_platform_interface.dart';

class LinkosSdk {
  Future<String?> getPlatformVersion() {
    return LinkosSdkPlatform.instance.getPlatformVersion();
  }
}
