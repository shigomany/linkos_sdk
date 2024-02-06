import 'package:pigeon/pigeon.dart';

/// {@nodoc}
class ConnectionInfo {
  const ConnectionInfo({
    this.ipAddress,
    this.macAddress,
    this.port,
  });

  final String? ipAddress;
  final String? macAddress;
  final int? port;
}

/// Enumeration of the various printer control languages supported by Zebra Printers.
/// {@category Printer}
enum PrinterLanguage {
  /// Printer control language ZPL.
  zpl,

  /// Printer control language CPCL.
  cpcl,

  /// Printer control language line_print mode.
  linePrint;
}

/// Describe printer status.
/// {@category Printer}
@SwiftFunction('ZPrinterStatus')
enum PrinterStatus {
  /// The head is cold.
  headCold,

  /// The head is open.
  headOpen,

  /// The head is too hot.
  headTooHot,

  /// The paper is out.
  paperOut,

  /// There is a partial format in progress.
  partialFormatInProgress,

  /// The printer is paused.
  paused,

  /// The printer reports back that it is ready to print.
  readyToPrint,

  /// The receive buffer is full.
  receiveBufferFull,

  /// The ribbon is out.
  ribbonOut;
}

@HostApi()

/// {@nodoc}
abstract class PrinterAPI {
  /// Returns a [PrinterStatus] that can be used to determine the status of a printer.
  PrinterStatus currentStatus(ConnectionInfo info);

  /// Returns the printer control language (e.g. ZPL or CPCL) of the printer.
  PrinterLanguage controlLanguage(ConnectionInfo info);

  /// Prints an image to the connected device as a monochrome image.
  void printImage(ConnectionInfo info, Uint8List data);

  /// Sends the appropriate calibrate command to the printer.
  void calibrate(ConnectionInfo info);

  /// Sends the appropriate print configuration command to the printer.
  void printConfigurationLabel(ConnectionInfo info);

  /// Sends the appropriate restore defaults command to the printer.
  void restoreDefaults(ConnectionInfo info);

  /// Converts the specified command to bytes using the Java default charset and sends the bytes to the printer.
  void sendCommand(ConnectionInfo info, String command);

  /// Sends the appropriate reset command to the printer.
  void reset(ConnectionInfo info);
}
