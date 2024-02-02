import 'pigeons/printer_api.dart';
import 'printer_connection.dart';

/// {@macro src.LinkOS}
final class LinkOS {
  /// {@template src.LinkOS}
  /// This type is used to transfer the connection (Bluetooth or TCP/IP).
  ///
  /// **Note!** When an instance of a given class with a connection type is created,
  /// the moment of connection to the device occurs immediately before executing commands.
  /// {@endtemplate}
  const LinkOS(PrinterConnection connection) : _connection = connection;

  final PrinterConnection _connection;

  /// Returns the printer control language (e.g. ZPL or CPCL) of the printer.
  Future<PrinterLanguage> controlLanguage() {
    return switch (_connection) {
      TcpIpConnection(ipAddress: final ipAddress, port: final port) => () {
          final printerApi = PrinterAPI();

          return printerApi.controlLanguage(
            ConnectionInfo(ipAddress: ipAddress, port: port),
          );
        }(),
      BluetoothConnection(macAddress: final macAddress) => () {
          final printerApi = PrinterAPI();
          return printerApi.controlLanguage(
            ConnectionInfo(macAddress: macAddress),
          );
        }(),
    };
  }

  /// Returns a [PrinterStatus] that can be used to determine the status of a printer.
  Future<PrinterStatus> currentStatus() {
    return switch (_connection) {
      TcpIpConnection(ipAddress: final ipAddress, port: final port) => () {
          final printerApi = PrinterAPI();

          return printerApi.currentStatus(
            ConnectionInfo(ipAddress: ipAddress, port: port),
          );
        }(),
      BluetoothConnection(macAddress: final macAddress) => () {
          final printerApi = PrinterAPI();
          return printerApi.currentStatus(
            ConnectionInfo(macAddress: macAddress),
          );
        }(),
    };
  }
}
