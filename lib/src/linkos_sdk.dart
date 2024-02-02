import 'dart:typed_data';

import 'pigeons/printer_api.dart';
import 'printer_connection.dart';

/// {@macro src.LinkOS}
/// {@category Printer}
final class LinkOS {
  /// {@template src.LinkOS}
  /// This type is used to transfer the connection (Bluetooth or TCP/IP).
  ///
  /// **Note!** When an instance of a given class with a connection type is created,
  /// the moment of connection to the device occurs immediately before executing commands.
  /// {@endtemplate}
  const LinkOS(PrinterConnection connection) : _connection = connection;

  final PrinterConnection _connection;

  static final _printerApi = PrinterAPI();

  /// Returns the printer control language (e.g. ZPL or CPCL) of the printer.
  Future<PrinterLanguage> controlLanguage() {
    return _printerApi.controlLanguage(_connectionInfo);
  }

  /// Returns a [PrinterStatus] that can be used to determine the status of a printer.
  Future<PrinterStatus> currentStatus() {
    return _printerApi.currentStatus(_connectionInfo);
  }

  /// Prints an image to the connected device as a monochrome image.
  Future<void> printImage(Uint8List data) {
    return _printerApi.printImage(_connectionInfo, data);
  }

  /// Sends the appropriate calibrate command to the printer.
  Future<void> calibrate() {
    return _printerApi.calibrate(_connectionInfo);
  }

  /// Sends the appropriate print configuration command to the printer.
  Future<void> printConfigurationLabel() {
    return _printerApi.printConfigurationLabel(_connectionInfo);
  }

  /// Sends the appropriate restore defaults command to the printer.
  Future<void> restoreDefaults() {
    return _printerApi.restoreDefaults(_connectionInfo);
  }

  /// Converts the specified command to bytes using the Java default charset and sends the bytes to the printer.
  Future<void> sendCommand(String command) {
    return _printerApi.sendCommand(_connectionInfo, command);
  }

  /// Sends the appropriate reset command to the printer.
  Future<void> reset() {
    return _printerApi.reset(_connectionInfo);
  }

  ConnectionInfo get _connectionInfo {
    return switch (_connection) {
      TcpIpConnection(ipAddress: final ipAddress, port: final port) =>
        ConnectionInfo(ipAddress: ipAddress, port: port),
      BluetoothConnection(macAddress: final macAddress) =>
        ConnectionInfo(macAddress: macAddress),
    };
  }
}
