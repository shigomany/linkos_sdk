import Flutter
import UIKit

public class LinkosSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "linkos_sdk", binaryMessenger: registrar.messenger())
    let instance = LinkosSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    PrinterAPISetup.setUp(binaryMessenger: registrar.messenger(), api: ImplPrinterAPI())
    NetworkDiscoveryPrintersAPISetup.setUp(binaryMessenger: registrar.messenger(), api: ImplNetworkDiscoveryPrintersAPI())
  }
}
