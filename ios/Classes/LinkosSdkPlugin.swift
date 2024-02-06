#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

public class LinkosSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "linkos_sdk", binaryMessenger: registrar.messenger())
    let instance = LinkosSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    PrinterAPISetup.setUp(binaryMessenger: registrar.messenger(), api: ImplPrinterAPI())
    NetworkDiscoveryPrintersAPISetup.setUp(binaryMessenger: registrar.messenger(), api: ImplNetworkDiscoveryPrintersAPI())
  }
}
