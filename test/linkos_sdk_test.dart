import 'package:flutter_test/flutter_test.dart';
import 'package:linkos_sdk/linkos_sdk.dart';
import 'package:linkos_sdk/linkos_sdk_platform_interface.dart';
import 'package:linkos_sdk/linkos_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLinkosSdkPlatform
    with MockPlatformInterfaceMixin
    implements LinkosSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LinkosSdkPlatform initialPlatform = LinkosSdkPlatform.instance;

  test('$MethodChannelLinkosSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLinkosSdk>());
  });

  test('getPlatformVersion', () async {
    LinkosSdk linkosSdkPlugin = LinkosSdk();
    MockLinkosSdkPlatform fakePlatform = MockLinkosSdkPlatform();
    LinkosSdkPlatform.instance = fakePlatform;

    expect(await linkosSdkPlugin.getPlatformVersion(), '42');
  });
}
