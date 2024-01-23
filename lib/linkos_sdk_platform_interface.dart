import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'linkos_sdk_method_channel.dart';

abstract class LinkosSdkPlatform extends PlatformInterface {
  /// Constructs a LinkosSdkPlatform.
  LinkosSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static LinkosSdkPlatform _instance = MethodChannelLinkosSdk();

  /// The default instance of [LinkosSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelLinkosSdk].
  static LinkosSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LinkosSdkPlatform] when
  /// they register themselves.
  static set instance(LinkosSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
