import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'linkos_sdk_platform_interface.dart';

/// An implementation of [LinkosSdkPlatform] that uses method channels.
class MethodChannelLinkosSdk extends LinkosSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('linkos_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
