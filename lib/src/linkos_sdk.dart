import 'pigeons/printer_tcpip_api.dart';
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
          final tcpIpSdk = LinkOsSdkOverTcpIpAPI();

          return tcpIpSdk.controlLanguage(ipAddress, port);
        }(),
      BluetoothConnection() =>
        throw UnimplementedError('Bluetooth supports in future'),
    };
  }

  /// Returns a [PrinterStatus] that can be used to determine the status of a printer.
  Future<PrinterStatus> currentStatus() {
    return switch (_connection) {
      TcpIpConnection(ipAddress: final ipAddress, port: final port) => () {
          final tcpIpSdk = LinkOsSdkOverTcpIpAPI();

          return tcpIpSdk.currentStatus(ipAddress, port);
        }(),
      BluetoothConnection() =>
        throw UnimplementedError('Bluetooth supports in future'),
    };
  }
}
