import 'package:pigeon/pigeon.dart';

/// Enumeration of the various printer control languages supported by Zebra Printers.
enum PrinterLanguage {
  /// Printer control language ZPL.
  zpl,

  /// Printer control language CPCL.
  cpcl,

  /// Printer control language line_print mode.
  linePrint;
}

/// Describe printer status.
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
abstract class LinkOsSdkOverTcpIp {
  /// Returns a [PrinterStatus] that can be used to determine the status of a printer.
  PrinterStatus currentStatus(String ipAddress, int? port);

  /// Returns the printer control language (e.g. ZPL or CPCL) of the printer.
  PrinterLanguage controlLanguage(String ipAddress, int? port);

  /// Prints an image to the connected device as a monochrome image.
  void printImage(String ipAddress, int? port, Uint8List data);

  /// Sends the appropriate calibrate command to the printer.
  void calibrate(String ipAddress, int? port);

  /// Sends the appropriate print configuration command to the printer.
  void printConfigurationLabel(String ipAddress, int? port);

  /// Sends the appropriate restore defaults command to the printer.
  void restoreDefaults(String ipAddress, int? port);

  /// Converts the specified command to bytes using the Java default charset and sends the bytes to the printer.
  void sendCommand(String ipAddress, int? port, String command);

  /// Sends the appropriate reset command to the printer.
  void reset(String ipAddress, int? port);
}
