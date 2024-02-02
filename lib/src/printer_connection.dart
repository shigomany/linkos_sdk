import 'utils/regex.dart';

/// Represents two types connection:
///
/// * Bluetooth - [BluetoothConnection]
/// * TCP/IP - [TcpIpConnection]
///
/// {@category Printer}
sealed class PrinterConnection {
  /// TCP/IP connection type.
  ///
  /// If the [port] is not specified, then the default ZPL port.
  factory PrinterConnection.tcpIp({
    required String ipAddress,
    int? port,
  }) = TcpIpConnection;

  /// Bluetooth connection type.
  factory PrinterConnection.bluetooth({
    required String macAddress,
  }) = BluetoothConnection;

  const PrinterConnection._();
}

/// TCP/IP connection type
///
/// {@category Printer}
final class TcpIpConnection extends PrinterConnection {
  final String ipAddress;

  final int? port;

  TcpIpConnection({
    required this.ipAddress,
    this.port,
  })  : assert(port == null || port >= 0, 'Port should not be negative'),
        assert(
          ipAddressRegex.hasMatch(ipAddress),
          'Invalid ip format',
        ),
        super._();
}

/// Bluetooth connection type
///
/// {@category Printer}
final class BluetoothConnection extends PrinterConnection {
  final String macAddress;

  BluetoothConnection({
    required this.macAddress,
  })  : assert(
          macAddressRegex.hasMatch(macAddress),
          'Invalid MAC address format',
        ),
        super._();
}
