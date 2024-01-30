/// Library LinkOS SDK
///
/// Wrapper library on top of [LinkOS SDK](https://techdocs.zebra.com/link-os/)
library linkos_sdk;

export 'src/printer_connection.dart' show PrinterConnection;
export 'src/linkos_sdk.dart' show LinkOS;
export 'src/pigeons/linkos_sdk_over_tcpip.dart'
    show PrinterLanguage, PrinterStatus;
