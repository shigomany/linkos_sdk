/// Library LinkOS SDK
///
/// Wrapper library on top of [LinkOS SDK](https://techdocs.zebra.com/link-os/)
library linkos_sdk;

export 'src/zebra_factory.dart' show ZebraFactory;
export 'src/printer_connection.dart' show PrinterConnection;
export 'src/zebra_printer.dart' show ZebraPrinter;

// import 'linkos_sdk_platform_interface.dart';

// class LinkosSdk {
//   Future<String?> getPlatformVersion() {
//     return LinkosSdkPlatform.instance.getPlatformVersion();
//   }
// }
